lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'ruby_http_client'
  spec.version = '3.3.0'
  spec.authors = ['Elmer Thomas']
  spec.email = 'dx@sendgrid.com'
  spec.summary = 'A simple REST client'
  spec.description = 'Quickly and easily access any REST or REST-like API.'
  spec.homepage = 'http://github.com/sendgrid/ruby-http-client'
  spec.license = 'MIT'
  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(/^bin/) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(/^(test|spec|features)/)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
