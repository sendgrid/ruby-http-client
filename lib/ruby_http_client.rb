# Quickly and easily access any REST or REST-like API.
module SendGrid
  require 'json'
  require 'net/http'
  require 'net/https'

  # Holds the response from an API call.
  class Response
    # Provide useful functionality around API rate limiting.
    class Ratelimit
      attr_reader :limit, :remaining, :reset

      # * *Args*    :
      #   - +limit+ -> The total number of requests allowed within a rate limit window
      #   - +remaining+ -> The number of requests that have been processed within this current rate limit window
      #   - +reset+ -> The time (in seconds since Unix Epoch) when the rate limit will reset
      def initialize(limit, remaining, reset)
        @limit = limit.to_i
        @remaining = remaining.to_i
        @reset = Time.at reset.to_i
      end

      def exceeded?
        remaining <= 0
      end

      # * *Returns* :
      #   - The number of requests that have been used out of this
      #     rate limit window
      def used
        limit - remaining
      end

      # Sleep until the reset time arrives. If given a block, it will
      # be called after sleeping is finished.
      #
      # * *Returns* :
      #   - The amount of time (in seconds) that the rate limit slept
      #     for.
      def wait!
        now = Time.now.utc.to_i
        duration = (reset.to_i - now) + 1

        sleep duration if duration >= 0

        yield if block_given?

        duration
      end
    end

    # * *Args*    :
    #   - +response+ -> A NET::HTTP response object
    #
    attr_reader :status_code, :body, :headers

    def initialize(response)
      @status_code = response.code
      @body = response.body
      @headers = response.to_hash
    end

    # Returns the body as a hash
    #
    def parsed_body
      @parsed_body ||= JSON.parse(@body, symbolize_names: true)
    end

    def ratelimit
      return @ratelimit unless @ratelimit.nil?

      limit = headers['X-RateLimit-Limit']
      remaining = headers['X-RateLimit-Remaining']
      reset = headers['X-RateLimit-Reset']

      # Guard against possibility that one (or probably, all) of the
      # needed headers were not returned.
      @ratelimit = Ratelimit.new(limit, remaining, reset) if limit && remaining && reset

      @ratelimit
    end
  end

  # A simple REST client.
  class Client
    attr_reader :host, :request_headers, :url_path, :request, :http
    # * *Args*    :
    #   - +host+ -> Base URL for the api. (e.g. https://api.sendgrid.com)
    #   - +request_headers+ -> A hash of the headers you want applied on
    #                          all calls
    #   - +version+ -> The version number of the API.
    #                  Subclass add_version for custom behavior.
    #                  Or just pass the version as part of the URL
    #                  (e.g. client._("/v3"))
    #   - +url_path+ -> A list of the url path segments
    #   - +proxy_options+ -> A hash of proxy settings.
    #                        (e.g. { host: '127.0.0.1', port: 8080 })
    #
    def initialize(host: nil, request_headers: nil, version: nil, url_path: nil, http_options: {}, proxy_options: {}) # rubocop:disable Metrics/ParameterLists
      @host = host
      @request_headers = request_headers || {}
      @version = version
      @url_path = url_path || []
      @methods = %w[delete get patch post put]
      @query_params = nil
      @request_body = nil
      @http_options = http_options
      @proxy_options = proxy_options
    end

    # Update the headers for the request
    #
    # * *Args*    :
    #   - +request_headers+ -> Hash of request header key/values
    #
    def update_headers(request_headers)
      @request_headers.merge!(request_headers)
    end

    # Build the final request headers
    #
    # * *Args*    :
    #   - +request+ -> HTTP::NET request object
    # * *Returns* :
    #   - HTTP::NET request object
    #
    def build_request_headers(request)
      @request_headers.each do |key, value|
        request[key] = value
      end
      request
    end

    # Add the API version, subclass this function to customize
    #
    # * *Args*    :
    #   - +url+ -> An empty url string
    # * *Returns* :
    #   - The url string with the version pre-pended
    #
    def add_version(url = nil)
      path = @version ? "/#{@version}" : ''
      url.concat(path)
    end

    # Add query parameters to the url
    #
    # * *Args*    :
    #   - +url+ -> path to endpoint
    #   - +query_params+ -> hash of query parameters
    # * *Returns* :
    #   - The url string with the query parameters appended
    #
    def build_query_params(url, query_params)
      params = URI.encode_www_form(query_params)
      url.concat("?#{params}")
    end

    # Set the query params, request headers and request body
    #
    # * *Args*    :
    #   - +args+ -> array of args obtained from method_missing
    #
    def build_args(args)
      args.each do |arg|
        arg.each do |key, value|
          case key.to_s
          when 'query_params'
            @query_params = value
          when 'request_headers'
            update_headers(value)
          when 'request_body'
            @request_body = value
          end
        end
      end
    end

    # Build the final url
    #
    # * *Args*    :
    #   - +query_params+ -> A hash of query parameters
    # * *Returns* :
    #   - The final url string
    #
    def build_url(query_params: nil)
      url = [add_version(''), *@url_path].join('/')
      url = build_query_params(url, query_params) if query_params
      URI.parse("#{@host}#{url}")
    end

    # Build the API request for HTTP::NET
    #
    # * *Args*    :
    #   - +name+ -> method name, received from method_missing
    #   - +args+ -> args passed to the method
    # * *Returns* :
    #   - A Response object from make_request
    #
    def build_request(name, args)
      build_args(args) if args
      # build the request & http object
      build_http_request(name)
      # set the content type & request body
      update_content_type(name)
      make_request(@http, @request)
    end

    # Make the API call and return the response. This is separated into
    # it's own function, so we can mock it easily for testing.
    #
    # * *Args*    :
    #   - +http+ -> NET:HTTP request object
    #   - +request+ -> NET::HTTP request object
    # * *Returns* :
    #   - Response object
    #
    def make_request(http, request)
      response = http.request(request)
      Response.new(response)
    end

    # Build HTTP request object
    #
    # * *Returns* :
    #   - Request object
    def build_http(host, port)
      params = [host, port]
      params += @proxy_options.values_at(:host, :port, :user, :pass) unless @proxy_options.empty?
      add_ssl(Net::HTTP.new(*params))
    end

    # Allow for https calls
    #
    # * *Args*    :
    #   - +http+ -> HTTP::NET object
    # * *Returns* :
    #   - HTTP::NET object
    #
    def add_ssl(http)
      if host.start_with?('https')
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end
      http
    end

    # Add variable values to the url.
    # (e.g. /your/api/{variable_value}/call)
    # Another example: if you have a ruby reserved word, such as true,
    # in your url, you must use this method.
    #
    # * *Args*    :
    #   - +name+ -> Name of the url segment
    # * *Returns* :
    #   - Client object
    #
    def _(name = nil)
      url_path = name ? @url_path + [name] : @url_path
      Client.new(host: @host, request_headers: @request_headers,
                 version: @version, url_path: url_path,
                 http_options: @http_options)
    end

    # Dynamically add segments to the url, then call a method.
    # (e.g. client.name.name.get())
    #
    # * *Args*    :
    #   - The args are automatically passed in
    # * *Returns* :
    #   - Client object or Response object
    #
    # rubocop:disable Style/MethodMissingSuper
    # rubocop:disable Style/MissingRespondToMissing
    def method_missing(name, *args, &_block)
      # Capture the version
      if name.to_s == 'version'
        @version = args[0]
        return _
      end
      # We have reached the end of the method chain, make the API call
      return build_request(name, args) if @methods.include?(name.to_s)

      # Add a segment to the URL
      _(name)
    end

    private

    def build_http_request(http_method)
      uri = build_url(query_params: @query_params)
      net_http = Kernel.const_get('Net::HTTP::' + http_method.to_s.capitalize)

      @http = build_http(uri.host, uri.port)
      @request = build_request_headers(net_http.new(uri.request_uri))
    end

    def update_content_type(http_method)
      if @request_body && content_type_json?
        # If body is a hash or array, encode it; else leave it alone
        @request.body = if [Hash, Array].include?(@request_body.class)
                          @request_body.to_json
                        else
                          @request_body
                        end
        @request['Content-Type'] = 'application/json'
      elsif !@request_body && http_method.to_s == 'post'
        @request['Content-Type'] = ''
      else
        @request.body = @request_body
      end
    end

    def content_type_json?
      !@request_headers.key?('Content-Type') ||
        @request_headers['Content-Type'] == 'application/json'
    end
    # rubocop:enable Style/MethodMissingSuper
    # rubocop:enable Style/MissingRespondToMissing
  end
end
