# Change Log
All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](http://semver.org/).

[2017-10-30] Version 3.3.0
--------------------------
## Added
- #11 fix: Allow for multiple values for a parameter
- Thanks to [xiaoboa](https://github.com/xiaoboa) for the pull request!

## [3.2.0] - 2017-09-01
### Added
- #12 Add a helper returns the response body as a hash
- Thanks to [Diego Camargo](https://github.com/belfazt) for the pull request!

## [3.1.0] - 2016-04-10
### Added
- #5 Ability to set the Content-Type header
- Thanks to [Wataru Sato](https://github.com/awwa) for the pull request!

## [3.0.2] - 2016-04-10
### Update
- #8 Internal refactor
- Thanks to [ciamiz](https://github.com/ciamiz) for the pull request!

## [3.0.1] - 2016-01-25
### Fix
- [Pull Request #7](https://github.com/sendgrid/ruby-http-client/pull/7)
- Fixes [issue #6](https://github.com/sendgrid/ruby-http-client/issues/6): TLS certificates not verified
- Thanks to [Koen Rouwhorst](https://github.com/koenrh) for the pull request!

## [3.0.0] - 2016-07-23
### BREAKING CHANGE
- Implements [issue #3](https://github.com/sendgrid/ruby-http-client/issues/3): Headers on Response
- Response headers now return a hash instead of a string
- Thanks to [Chris France](https://github.com/hipsterelitist) for the pull request!

## [2.1.4] - 2016-07-12
### Fix
- [Pull Request #2](https://github.com/sendgrid/ruby-http-client/pull/2), thanks [Billy Watson](https://github.com/billywatson)!
- Remove Rubygems version: http://guides.rubygems.org/specification-reference/#rubygems_version

## [2.1.3] - 2016-06-14
### Fix
- Logic error

## [2.1.2] - 2016-06-14
### Fix
- Typo in 2.1.1 fix

## [2.1.1] - 2016-06-10
### Fix
- Deal with an edge case where when you send a POST with no body, net/http sets the content type to application/x-www-form-urlencoded

## [2.1.0] - 2016-06-10
### Added
- Automatically add Content-Type: application/json when there is a request body

## [2.0.0] - 2016-06-03
### Changed
- Made the Response variables non-redundant. e.g. response.response_body becomes response.body

### Removed
- Config class

## [1.1.0] - 2016-03-17
### Added
- Config class moved to client

## [1.0.0] - 2016-03-17
### Added
- We are live!