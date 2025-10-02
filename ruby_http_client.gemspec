lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'ruby_http_client'
  spec.version = '3.5.5'
  spec.authors = ['Elmer Thomas']
  spec.email = 'help@twilio.com'
  spec.summary = 'A simple REST client'
  spec.description = 'Quickly and easily access any REST or REST-like API.'
  spec.homepage = 'http://github.com/sendgrid/ruby-http-client'
  spec.license = 'MIT'
  spec.files = Dir['lib/**/*'] + ['LICENSE', 'README.md', 'CHANGELOG.md']
  spec.executables = spec.files.grep(/^bin/) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'codecov'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'simplecov', '~> 0.18.5'
end
