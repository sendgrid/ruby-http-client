# Change Log
All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](http://semver.org/).

[2020-03-04] Version 3.5.0
--------------------------
**Library - Fix**
- [PR #118](https://github.com/sendgrid/ruby-http-client/pull/118): JSON-encode array request bodies. Thanks to [@childish-sambino](https://github.com/childish-sambino)!
- [PR #67](https://github.com/sendgrid/ruby-http-client/pull/67): Split up the build_request function to logical component functions to reduce method complexity. Thanks to [@sony-mathew](https://github.com/sony-mathew)!
- [PR #115](https://github.com/sendgrid/ruby-http-client/pull/115): update incorrect gem name. Thanks to [@thinkingserious](https://github.com/thinkingserious)!

**Library - Chore**
- [PR #116](https://github.com/sendgrid/ruby-http-client/pull/116): add Ruby 2.7 to Travis. Thanks to [@childish-sambino](https://github.com/childish-sambino)!
- [PR #92](https://github.com/sendgrid/ruby-http-client/pull/92): Add CodeCov support to .travis.yml. Thanks to [@jamietanna](https://github.com/jamietanna)!

**Library - Feature**
- [PR #68](https://github.com/sendgrid/ruby-http-client/pull/68): add ratelimit support. Thanks to [@awj](https://github.com/awj)!

**Library - Test**
- [PR #98](https://github.com/sendgrid/ruby-http-client/pull/98): Fix rubocop.yml formatting warnings. Thanks to [@RolandBurrows](https://github.com/RolandBurrows)!

**Library - Docs**
- [PR #100](https://github.com/sendgrid/ruby-http-client/pull/100): adding code review section under contributing.md. Thanks to [@prathamsharma92](https://github.com/prathamsharma92)!
- [PR #101](https://github.com/sendgrid/ruby-http-client/pull/101): Grammerly checks on *.md files. Thanks to [@prathamsharma92](https://github.com/prathamsharma92)!
- [PR #84](https://github.com/sendgrid/ruby-http-client/pull/84): Corrected *.md files using Grammarly. Thanks to [@pushkyn](https://github.com/pushkyn)!


[2020-02-19] Version 3.4.3
--------------------------
**Library - Fix**
- [PR #95](https://github.com/sendgrid/ruby-http-client/pull/95): JSON body reencoding and Rubocop configuration. Thanks to [@guillemm](https://github.com/guillemm)!


[2020-01-22] Version 3.4.2
--------------------------
**Library - Fix**
- [PR #114](https://github.com/sendgrid/ruby-http-client/pull/114): add skip_cleanup flag to fix travis deploy. Thanks to [@thinkingserious](https://github.com/thinkingserious)!


[2020-01-22] Version 3.4.1
--------------------------
**Library - Docs**
- [PR #113](https://github.com/sendgrid/ruby-http-client/pull/113): baseline all the templated markdown docs. Thanks to [@childish-sambino](https://github.com/childish-sambino)!


[2020-01-09] Version 3.4.0
--------------------------
**Library - Fix**
- [PR #108](https://github.com/sendgrid/ruby-http-client/pull/108): Avoid mutating @url_path to avoid unexpected side effects. Thanks to [@tachyons](https://github.com/tachyons)!
- [PR #49](https://github.com/sendgrid/ruby-http-client/pull/49): change year for the license file. Thanks to [@luiscobits](https://github.com/luiscobits)!
- [PR #48](https://github.com/sendgrid/ruby-http-client/pull/48): update LICENSE - fix year. Thanks to [@pushkyn](https://github.com/pushkyn)!

**Library - Docs**
- [PR #105](https://github.com/sendgrid/ruby-http-client/pull/105): Add our Developer Experience Engineer career opportunity to the READM…. Thanks to [@mptap](https://github.com/mptap)!
- [PR #61](https://github.com/sendgrid/ruby-http-client/pull/61): update CONTRIBUTING.md. Thanks to [@thepriefy](https://github.com/thepriefy)!
- [PR #86](https://github.com/sendgrid/ruby-http-client/pull/86): Add first time contributor documentation. Thanks to [@eyewritecode](https://github.com/eyewritecode)!
- [PR #91](https://github.com/sendgrid/ruby-http-client/pull/91): update contribution to branch off development. Thanks to [@vikasnautiyal](https://github.com/vikasnautiyal)!
- [PR #72](https://github.com/sendgrid/ruby-http-client/pull/72): Add USAGE.md. Thanks to [@ProZsolt](https://github.com/ProZsolt)!
- [PR #73](https://github.com/sendgrid/ruby-http-client/pull/73): Create a Use Cases Directory. Thanks to [@ProZsolt](https://github.com/ProZsolt)!
- [PR #41](https://github.com/sendgrid/ruby-http-client/pull/41): Create PULL_REQUEST_TEMPLATE.md. Thanks to [@flaredragon](https://github.com/flaredragon)!

**Library - Chore**
- [PR #80](https://github.com/sendgrid/ruby-http-client/pull/80): Missing Dev Dependencies + rubocop  #79. Thanks to [@kplimack](https://github.com/kplimack)!
- [PR #66](https://github.com/sendgrid/ruby-http-client/pull/66): delete PULL_REQUEST_TEMPLATE.md. Thanks to [@thepriefy](https://github.com/thepriefy)!
- [PR #76](https://github.com/sendgrid/ruby-http-client/pull/76): Add Gemfile. Thanks to [@kplimack](https://github.com/kplimack)!
- [PR #58](https://github.com/sendgrid/ruby-http-client/pull/58): [Closes #55] Add code coverage reporting to CC. Thanks to [@lauratpa](https://github.com/lauratpa)!
- [PR #57](https://github.com/sendgrid/ruby-http-client/pull/57): [Closes #56] Fix some rubocop issues. Thanks to [@lauratpa](https://github.com/lauratpa)!
- [PR #50](https://github.com/sendgrid/ruby-http-client/pull/50): Added unittest to check for specific repo files. Thanks to [@mptap](https://github.com/mptap)!
- [PR #51](https://github.com/sendgrid/ruby-http-client/pull/51): Add License end year test. Thanks to [@diegous](https://github.com/diegous)!
- [PR #39](https://github.com/sendgrid/ruby-http-client/pull/39): Add a .env_sample file. Thanks to [@thepriefy](https://github.com/thepriefy)!
- [PR #112](https://github.com/sendgrid/ruby-http-client/pull/112): Auto-deploy upon successful tagged commit. Thanks to [@thinkingserious](https://github.com/thinkingserious)!
- [PR #111](https://github.com/sendgrid/ruby-http-client/pull/111): Update CHANGELOG heading format for automation. Thanks to [@thinkingserious](https://github.com/thinkingserious)!
- [PR #110](https://github.com/sendgrid/ruby-http-client/pull/110): Add Makefile for Librarian automation. Thanks to [@thinkingserious](https://github.com/thinkingserious)!

**Library - Feature**
- [PR #75](https://github.com/sendgrid/ruby-http-client/pull/75): Add ability to set proxy. Thanks to [@eitoball](https://github.com/eitoball)!
- [PR #20](https://github.com/sendgrid/ruby-http-client/pull/20): Add option to set http attributes when creating an instance of Client. Thanks to [@jrectenwald](https://github.com/jrectenwald)!


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