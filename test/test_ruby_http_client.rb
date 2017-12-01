require './test/test_helper'
require 'ruby_http_client'
require 'minitest/autorun'

class MockResponse
  attr_reader :status_code, :body, :headers

  def initialize(response)
    @status_code = response['code']
    @body = response['body']
    @headers = response['headers']
  end
end

class MockRequest < SendGrid::Client
  def make_request(_http, _request)
    response = {}
    response['code'] = 200
    response['body'] = { 'message' => 'success' }
    response['headers'] = { 'headers' => 'test' }
    MockResponse.new(response)
  end
end

class TestClient < Minitest::Test
  def setup
    @headers = JSON.parse('
            {
                "Authorization": "Bearer XXXXXXX",
                "Content-Type": "application/json"
            }
        ')
    @host = 'http://localhost:4010'
    @version = 'v3'
    @client = MockRequest.new(host: @host,
                              request_headers: @headers,
                              version: @version)
  end

  def test_init
    assert_equal(@host, @client.host)
    assert_equal(@headers, @client.request_headers)
  end

  def test_update_headers
    request_headers = { 'X-Test' => 'test' }
    @client.update_headers(request_headers)
    assert_equal(@headers.merge(request_headers), @client.request_headers)
  end

  def test_build_request_headers
    request = {}
    request = @client.build_request_headers(request)
    assert_equal(request, @client.request_headers)
  end

  def test_add_version
    url = ''
    @client.add_version(url)
    assert_equal("/#{@version}", url)
  end

  def test_build_query_params
    url = ''
    query_params = { 'limit' => 100, 'offset' => 0, 'categories' => ['category1', 'category2'] }
    url = @client.build_query_params(url, query_params)
    assert_equal('?limit=100&offset=0&categories=category1&categories=category2', url)
  end

  def test_build_url
    url1 = @client.my.path.to.the.endpoint
    params = { 'limit' => 100, 'offset' => 0 }
    url = URI.parse(@host + '/' + @version +
                    '/my/path/to/the/endpoint?limit=100&offset=0')
    assert_equal(url, url1.build_url(query_params: params))

    url1 = url1.one_more
    params = { 'limit' => 100, 'offset' => 0 }
    url = URI.parse(@host + '/' + @version +
                    '/my/path/to/the/endpoint/one_more?limit=100&offset=0')
    assert_equal(url, url1.build_url(query_params: params))

    url2 = @client.my.path._('to').the.endpoint
    params = { 'limit' => 100, 'offset' => 0 }
    url = URI.parse(@host + '/' + @version +
                    '/my/path/to/the/endpoint?limit=100&offset=0')
    assert_equal(url, url2.build_url(query_params: params))
  end

  def test_build_request
    name = 'get'
    args = nil
    response = @client.build_request(name, args)
    assert_equal(200, response.status_code)
    assert_equal({'message' => 'success'}, response.body)
    assert_equal({'headers' => 'test'}, response.headers)
  end

  def test_build_request_post_empty_content_type
    headers = {
    }
    client = MockRequest.new(
      host: 'https://localhost',
      request_headers: headers,
      version: 'v3'
    )
    args = [{'request_body' => {"hogekey" => "hogevalue"}}]
    client.build_request('post', args)
    assert_equal('application/json', client.request['Content-Type'])
    assert_equal('{"hogekey":"hogevalue"}', client.request.body)
  end

  def test_build_request_get_application_json
    headers = {
      'Content-Type' => 'application/json'
    }
    client = MockRequest.new(
      host: 'https://localhost',
      request_headers: headers,
      version: 'v3'
    )
    client.build_request('get', nil)
    assert_equal('application/json', client.request['Content-Type'])
    assert_nil(client.request.body)
  end

  def test_build_request_post_empty_body
    headers = {
      'Content-Type' => 'application/json'
    }
    client = MockRequest.new(
      host: 'https://localhost',
      request_headers: headers,
      version: 'v3'
    )
    client.build_request('post', nil)
    assert_equal('', client.request['Content-Type'])
    assert_nil(client.request.body)
  end

  def test_build_request_post_multipart
    headers = {
      'Content-Type' => 'multipart/form-data; boundary=xYzZY'
    }
    client = MockRequest.new(
      host: 'https://localhost',
      request_headers: headers,
    )
    name = 'post'
    args = [{'request_body' => 'hogebody'}]
    client.build_request(name, args)
    assert_equal('multipart/form-data; boundary=xYzZY', client.request['Content-Type'])
    assert_equal('hogebody', client.request.body)
  end

  def add_ssl
    uri = URI.parse('https://localhost:4010')
    http = Net::HTTP.new(uri.host, uri.port)
    http = @client.add_ssl(http)
    assert_equal(http.use_ssl, true)
    assert_equal(http.verify_mode, OpenSSL::SSL::VERIFY_PEER)
  end

  def test__
    url1 = @client._('test')
    assert_equal(['test'], url1.url_path)
  end

  def test_method_missing
    response = @client.get
    assert_equal(200, response.status_code)
    assert_equal({'message' => 'success'}, response.body)
    assert_equal({'headers' => 'test'}, response.headers)
  end

  def test_docker_exists
    assert(File.file?('./Dockerfile') || File.file?('./docker/Dockerfile'))
  end

  def test_docker_compose_exists
    assert(File.file?('./docker-compose.yml') || File.file?('./docker/docker-compose.yml'))
  end

  def test_env_sample_exists
    assert(File.file?('./.env_sample'))
  end

  def test_gitignore_exists
    assert(File.file?('./.gitignore'))
  end

  def test_travis_exists
    assert(File.file?('./.travis.yml'))
  end

  def test_codeclimate_exists
    assert(File.file?('./.codeclimate.yml'))
  end

  def test_changelog_exists
    assert(File.file?('./CHANGELOG.md'))
  end

  def test_code_of_conduct_exists
    assert(File.file?('./CODE_OF_CONDUCT.md'))
  end

  def test_contributing_exists
    assert(File.file?('./CONTRIBUTING.md'))
  end

  def test_issue_template_exists
    assert(File.file?('./.github/ISSUE_TEMPLATE'))
  end

  def test_license_exists
    assert(File.file?('./LICENSE.md') || File.file?('./LICENSE.txt'))
  end

  def test_pull_request_template_exists
    assert(File.file?('./.github/PULL_REQUEST_TEMPLATE'))
  end

  def test_readme_exists
    assert(File.file?('./README.md'))
  end

  def test_troubleshooting_exists
    assert(File.file?('./TROUBLESHOOTING.md'))
  end

  def test_usage_exists
    assert(File.file?('./USAGE.md'))
  end

  def test_use_cases_exists
    assert(File.file?('./USE_CASES.md'))
  end 
  
  def test_license_date_is_updated
    license_end_year = IO.read('LICENSE.txt').match(/Copyright \(c\) 2016-(\d{4}) SendGrid/)[1].to_i
    current_year = Time.new.year
    assert_equal(current_year, license_end_year)
  end
  
end
