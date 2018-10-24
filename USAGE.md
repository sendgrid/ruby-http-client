# Usage

Usage examples for SendGrid ruby-http-client

## Initialization

```ruby
require_relative '../lib/ruby_http_client'

# This uses the SendGrid API as an example
headers = JSON.parse('
  {
    "Authorization": "Bearer ' + ENV['SENDGRID_API_KEY'] + '"
  }
')
host = 'https://api.sendgrid.com'
client = SendGrid::Client.new(host: host, request_headers: headers)
```

## Table of Contents

- [GET](#get)
- [DELETE](#delete)
- [POST](#post)
- [PUT](#put)
- [PATCH](#patch)

## GET

#### GET Collection

```ruby
query_params = { 'limit' => 100, 'offset' => 0 }
response = client.version('v3').api_keys.get(query_params: query_params)
puts response.status_code
puts response.body
puts response.headers
```

#### GET Single

```ruby
response = client.version('v3').api_keys._(api_key_id).get
puts response.status_code
puts response.body
puts response.headers
```

## DELETE

```ruby
response = client.api_keys._(api_key_id).delete
puts response.status_code
puts response.headers
```

## POST

```ruby
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
```

## PUT

```ruby
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
```

## PATCH

```ruby
request_body = JSON.parse('
    {
        "name": "A New Hope"
    }
')
response = client.api_keys._(api_key_id).patch(request_body: request_body)
puts response.status_code
puts response.body
puts response.headers
```
