![SendGrid Logo](https://uiux.s3.amazonaws.com/2016-logos/email-logo%402x.png)

[![BuildStatus](https://travis-ci.org/sendgrid/ruby-http-client.svg?branch=master)](https://travis-ci.org/sendgrid/ruby-http-client)
[![Email Notifications Badge](https://dx.sendgrid.com/badge/ruby)](https://dx.sendgrid.com/newsletter/ruby)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE.txt)
[![Twitter Follow](https://img.shields.io/twitter/follow/sendgrid.svg?style=social&label=Follow)](https://twitter.com/sendgrid)
[![GitHub contributors](https://img.shields.io/github/contributors/sendgrid/ruby-http-client.svg)](https://github.com/sendgrid/ruby-http-client/graphs/contributors)

**Quickly and easily access any RESTful or RESTful-like API.**

If you are looking for the SendGrid API client library, please see [this repo](https://github.com/sendgrid/sendgrid-ruby).

# Announcements

All updates to this library is documented in our [CHANGELOG](https://github.com/sendgrid/ruby-http-client/blob/master/CHANGELOG.md).

# Table of Contents
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [How to Contribute](#contribute)
- [About](#about)
- [License](#license)

<a name="installation"></a>
# Installation

## Prerequisites

- Ruby version 2.2+

## Install Package

```bash
gem install ruby_http_client
```

<a name="quick-start"></a>
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

<a name="usage"></a>
# Usage

- [Example Code](https://github.com/sendgrid/ruby-http-client/tree/master/examples)

<a name="roadmap"></a>
# Roadmap

If you are interested in the future direction of this project, please take a look at our [milestones](https://github.com/sendgrid/ruby-http-client/milestones). We would love to hear your feedback.

<a name="contribute"></a>
# How to Contribute

We encourage contribution to our libraries, please see our [CONTRIBUTING](https://github.com/sendgrid/ruby-http-client/blob/master/CONTRIBUTING.md) guide for details.

Quick links:

- [Feature Request](https://github.com/sendgrid/ruby-http-client/blob/master/CONTRIBUTING.md#feature-request)
- [Bug Reports](https://github.com/sendgrid/ruby-http-client/blob/master/CONTRIBUTING.md#submit-a-bug-report)
- [Sign the CLA to Create a Pull Request](https://github.com/sendgrid/ruby-http-client/blob/master/CONTRIBUTING.md)
- [Improvements to the Codebase](https://github.com/sendgrid/ruby-http-client/blob/master/CONTRIBUTING.md#improvements-to-the-codebase)

<a name="about"></a>
# About

ruby-http-client is guided and supported by the SendGrid [Developer Experience Team](mailto:dx@sendgrid.com).

ruby-http-client is maintained and funded by SendGrid, Inc. The names and logos for ruby-http-client are trademarks of SendGrid, Inc.

![SendGrid Logo](https://uiux.s3.amazonaws.com/2016-logos/email-logo%402x.png)

# License
[The MIT License (MIT)](LICENSE.txt)
