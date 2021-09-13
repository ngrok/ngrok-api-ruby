# -*- encoding: utf-8 -*-

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'ngrokapi/version'

Gem::Specification.new do |s|
  s.name        = 'ngrok-api-ruby'
  s.version     = NgrokAPI::VERSION
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ['MIT']
  s.authors     = ['A name']
  s.email       = ['support@ngrok.com']
  s.homepage    = 'https://github.com/ngrok/ngrok-api-ruby'
  s.summary     = 'Summary of the Ngrok Ruby API.'
  s.description = 'Description of the Ngrok Ruby API.'

  s.required_ruby_version = '>= 3.0.0'

  all_files = `git ls-files`.split("\n")
  test_files = `git ls-files -- {test,spec,features}/*`.split('\n')

  s.files = all_files - test_files
  s.executables = `git ls-files -- bin/*`.split('\n').map { |f| File.basename(f) }
  s.require_paths = ['lib']
end
