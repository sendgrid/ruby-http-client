![SendGrid Logo](twilio_sendgrid_logo.png)

[![BuildStatus](https://travis-ci.org/sendgrid/ruby-http-client.svg?branch=main)](https://travis-ci.org/sendgrid/ruby-http-client)
[![Email Notifications Badge](https://dx.sendgrid.com/badge/ruby)](https://dx.sendgrid.com/newsletter/ruby)
[![Gem Version](https://badge.fury.io/rb/ruby_http_client.svg)](https://badge.fury.io/rb/ruby_http_client)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE.md)
[![Twitter Follow](https://img.shields.io/twitter/follow/sendgrid.svg?style=social&label=Follow)](https://twitter.com/sendgrid)
[![GitHub contributors](https://img.shields.io/github/contributors/sendgrid/ruby-http-client.svg)](https://github.com/sendgrid/ruby-http-client/graphs/contributors)

**Quickly and easily access any RESTful or RESTful-like API.**

If you are looking for the SendGrid API client library, please see [this repo](https://github.com/sendgrid/sendgrid-ruby).

# Announcements
**The default branch name for this repository has been changed to `main` as of 07/27/2020.**

All updates to this library are documented in our [CHANGELOG](CHANGELOG.md).

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

<a name="roadmap"></a>
# Roadmap

If you are interested in the future direction of this project, please take a look at our [milestones](https://github.com/sendgrid/ruby-http-client/milestones). We would love to hear your feedback.

<a name="contribute"></a>
# How to Contribute

We encourage contribution to our libraries, please see our [CONTRIBUTING](CONTRIBUTING.md) guide for details.

Quick links:

- [Feature Request](CONTRIBUTING.md#feature-request)
- [Bug Reports](CONTRIBUTING.md#submit-a-bug-report)
- [Improvements to the Codebase](CONTRIBUTING.md#improvements-to-the-codebase)
- [Review Pull Requests](CONTRIBUTING.md#code-reviews)

<a name="about"></a>
# About

ruby-http-client is maintained and funded by Twilio SendGrid, Inc. The names and logos for ruby-http-client are trademarks of Twilio SendGrid, Inc.

If you need help installing or using the library, please check the [Twilio SendGrid Support Help Center](https://support.sendgrid.com).

If you've instead found a bug in the library or would like new features added, go ahead and open issues or pull requests against this repo!

# License
[The MIT License (MIT)](LICENSE.md)
