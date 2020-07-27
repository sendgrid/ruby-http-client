require_relative '../lib/ruby_http_client'

# This example uses the SendGrid API as an example
headers = JSON.parse('
  {
    "Authorization": "Bearer ' + ENV['SENDGRID_API_KEY'] + '"
  }
')
host = 'https://api.sendgrid.com'
client = SendGrid::Client.new(host: host, request_headers: headers)

# You can pass in an http_options hash to set values for NET::HTTP attributes
# https://ruby-doc.org/stdlib-2.4.1/libdoc/net/http/rdoc/Net/HTTP.html
# client = SendGrid::Client.new(host: host,
#                               request_headers: headers,
#                               http_options: {open_timeout: 15, read_timeout: 30})

# If you want to make request via proxy, you can set your proxy server in two ways.
#
# (1) Pass proxy_options hash
#
# client = SendGrid::Client.new(host: host,
#                               request_headers: headers,
#                               proxy_options: { host: '127.0.0.1', port: 8080 })
#
# (2) Set 'http_proxy' environment variable
#
# ENV['http_proxy'] = 'user:pass@127.0.0.1:8080'
# client = SendGrid::Client.new(host: host, request_headers: headers)

# GET Collection
query_params = { 'limit' => 100, 'offset' => 0 }
response = client.version('v3').api_keys.get(query_params: query_params)
puts response.status_code
puts response.body
puts response.headers

# POST
request_body = JSON.parse('
    {
        "name": "My API Key Ruby Test",
        "scopes": [
            "mail.send",
            "alerts.create",
            "alerts.read"
        ]
    }
')
response = client.version('v3').api_keys.post(request_body: request_body)
puts response.status_code
puts response.body
puts response.headers
api_key_id = JSON.parse(response.body)['api_key_id']

# GET Single
response = client.version('v3').api_keys._(api_key_id).get
puts response.status_code
puts response.body
puts response.headers

# PATCH
request_body = JSON.parse('
    {
        "name": "A New Hope"
    }
')
response = client.api_keys._(api_key_id).patch(request_body: request_body)
puts response.status_code
puts response.body
puts response.headers

# PUT
request_body = JSON.parse('
    {
        "name": "A New Hope",
        "scopes": [
            "user.profile.read",
            "user.profile.update"
        ]
    }
')
response = client.api_keys._(api_key_id).put(request_body: request_body)
puts response.status_code
puts response.body
puts response.headers

# DELETE
response = client.api_keys._(api_key_id).delete
puts response.status_code
puts response.headers

# Rate limit information
response = client.version('v3').api_keys._(api_key_id).get
puts response.ratelimit.limit
puts response.ratelimit.remaining
puts response.ratelimit.reset
puts response.ratelimit.exceeded?
# Sleep the current thread until the reset has happened
response.ratelimit.wait!
