![SendGrid Logo](twilio_sendgrid_logo.png)

[![BuildStatus](https://github.com/sendgrid/ruby-http-client/actions/workflows/test-and-deploy.yml/badge.svg)](https://github.com/sendgrid/ruby-http-client/actions/workflows/test-and-deploy.yml)
[![Gem Version](https://badge.fury.io/rb/ruby_http_client.svg)](https://badge.fury.io/rb/ruby_http_client)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Twitter Follow](https://img.shields.io/twitter/follow/sendgrid.svg?style=social&label=Follow)](https://twitter.com/sendgrid)
[![GitHub contributors](https://img.shields.io/github/contributors/sendgrid/ruby-http-client.svg)](https://github.com/sendgrid/ruby-http-client/graphs/contributors)

**Quickly and easily access any RESTful or RESTful-like API.**

If you are looking for the SendGrid API client library, please see [this repo](https://github.com/sendgrid/sendgrid-ruby).

# Announcements
All updates to this library are documented in our [CHANGELOG](CHANGELOG.md).

# Table of Contents
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Usage](#usage)
- [How to Contribute](#contribute)
- [About](#about)
- [Support](#support)
- [License](#license)

<a name="installation"></a>
# Installation

## Prerequisites

- Ruby version >= 2.4

## Setup Environment Variables

### Environment Variable

Update the development environment with your [SENDGRID_API_KEY](https://app.sendgrid.com/settings/api_keys), for example:

```bash
echo "export SENDGRID_API_KEY='YOUR_API_KEY'" > sendgrid.env
echo "sendgrid.env" >> .gitignore
source ./sendgrid.env
```

## Install Package

```bash
gem install ruby_http_client
```

<a name="quick-start"></a>
# Quick Start

`GET /your/api/{param}/call`

```ruby
require 'ruby_http_client'
global_headers = {'Authorization' => 'Bearer XXXXXXX' }
client = SendGrid::Client.new(host: 'base_url', request_headers: global_headers)
client.your.api._(param).call.get
puts response.status_code
puts response.body
puts response.headers
```

`POST /your/api/{param}/call` with headers, query parameters and a request body with versioning.

```ruby
require 'ruby_http_client'
global_headers = {'Authorization' => 'Bearer XXXXXXX' }
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

<a name="usage"></a>
# Usage

- [Example Code](examples)

<a name="contribute"></a>
# How to Contribute

We encourage contribution to our libraries, please see our [CONTRIBUTING](CONTRIBUTING.md) guide for details.

Quick links:

- [Improvements to the Codebase](CONTRIBUTING.md#improvements-to-the-codebase)
- [Review Pull Requests](CONTRIBUTING.md#code-reviews)

<a name="about"></a>
# About

ruby-http-client is maintained and funded by Twilio SendGrid, Inc. The names and logos for ruby-http-client are trademarks of Twilio SendGrid, Inc.

<a name="support"></a>
# Support

If you need help using SendGrid, please check the [Twilio SendGrid Support Help Center](https://support.sendgrid.com).

# License
[The MIT License (MIT)](LICENSE)
