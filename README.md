[![Travis Badge](https://travis-ci.org/sendgrid/ruby-http-client.svg?branch=master)](https://travis-ci.org/sendgrid/ruby-http-client)

**Quickly and easily access any RESTful or RESTful-like API.**

If you are looking for the SendGrid API client library, please see [this repo](https://github.com/sendgrid/sendgrid-ruby).

# Announcements

All updates to this library is documented in our [CHANGELOG](https://github.com/sendgrid/ruby-http-client/blob/master/CHANGELOG.md).

# Installation

## Prerequisites

- Ruby version 2.2

## Install Package

```bash
gem install ruby_http_client
```

# Quick Start

`GET /your/api/{param}/call`

```ruby
require 'ruby_http_client'
global_headers = {'Authorization' => 'Basic XXXXXXX' }
client = SendGrid::Client.new(host: 'base_url', request_headers: global_headers)
client.your.api._(param).call.get
puts response.status_code
puts response.body
puts response.headers
```

`POST /your/api/{param}/call` with headers, query parameters and a request body with versioning.

```ruby
require 'ruby_http_client'
global_headers = {'Authorization' => 'Basic XXXXXXX' }
client = SendGrid::Client.new(host: 'base_url', request_headers: global_headers)
query_params = { 'hello' => 0, 'world' => 1 }
request_headers = { 'X-Test' => 'test' }
data = { 'some' => 1, 'awesome' => 2, 'data' => 3}
response = client.your.api._(param).call.post(request_body: data,
                                              query_params: query_params,
                                              request_headers: request_headers)
puts response.status_code
puts response.body
puts response.headers
```

# Usage

- [Example Code](https://github.com/sendgrid/ruby-http-client/tree/master/examples)

## Roadmap

If you are interested in the future direction of this project, please take a look at our [milestones](https://github.com/sendgrid/ruby-http-client/milestones). We would love to hear your feedback.

## How to Contribute

We encourage contribution to our libraries, please see our [CONTRIBUTING](https://github.com/sendgrid/ruby-http-client/blob/master/CONTRIBUTING.md) guide for details.

Quick links:

- [Feature Request](https://github.com/sendgrid/ruby-http-client/blob/master/CONTRIBUTING.md#feature_request)
- [Bug Reports](https://github.com/sendgrid/ruby-http-client/blob/master/CONTRIBUTING.md#submit_a_bug_report)
- [Sign the CLA to Create a Pull Request](https://github.com/sendgrid/ruby-http-client/blob/master/CONTRIBUTING.md)
- [Improvements to the Codebase](https://github.com/sendgrid/ruby-http-client/blob/master/CONTRIBUTING.md#improvements_to_the_codebase)


# About

ruby-http-client is guided and supported by the SendGrid [Developer Experience Team](mailto:dx@sendgrid.com).

ruby-http-client is maintained and funded by SendGrid, Inc. The names and logos for ruby-http-client are trademarks of SendGrid, Inc.

![SendGrid Logo]
(https://uiux.s3.amazonaws.com/2016-logos/email-logo%402x.png)
