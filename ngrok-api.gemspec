# -*- encoding: utf-8 -*-

# Code generated for API Clients. DO NOT EDIT.

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'ngrokapi/version'

Gem::Specification.new do |s|
  s.name        = 'ngrok-api'
  s.version     = NgrokAPI::VERSION
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ['MIT']
  s.authors     = ['']
  s.email       = ['']
  s.homepage    = 'https://github.com/ngrok/ngrok-api-ruby'
  s.summary     = 'This library wraps the [ngrok HTTP API](https://ngrok.com/docs/api) to make
    it easier to consume in Ruby.'
  s.description = 'This library wraps the [ngrok HTTP API](https://ngrok.com/docs/api) to make
    it easier to consume in Ruby.'

  s.required_ruby_version = '>= 2.7.2'

  all_files = `git ls-files`.split("\n")
  test_files = `git ls-files -- {test,spec,features}/*`.split('\n')

  s.files = all_files - test_files
  s.executables = `git ls-files -- bin/*`.split('\n').map { |f| File.basename(f) }
  s.require_paths = ['lib']
end
