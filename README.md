# ngrok API client library for Ruby

This library wraps the [ngrok HTTP API](https://ngrok.com/docs/api) to make it
easier to consume in Ruby.

## Installation

This library is published on [Rubygems](https://rubygems.org/gems/TODO)

```ruby
gem install TODO
```

## Documentation

A quickstart guide and a full API reference are included in the [ngrok Ruby API documentation](https://ruby-api.docs.ngrok.com)

## Quickstart

Please consult the [documentation](https://ruby-api.docs.ngrok.com) for additional examples.

```ruby
require 'ngrokapi/client'
client = NgrokAPI::Client.new(api_key: '<API KEY>')

# Get an instance of the api_keys client and list all API keys
keys = client.api_keys
keys.list
```

## Local Documentation

Documentation can be generated with the command:

```ruby
bundle exec yard doc 'lib/**/*.rb'
```

This will generate a documentation which can be viewed within the doc folder.

## Specs

Specs can be run with the command:

```ruby
bundle exec rake
```

This will generate a coverage report which can be viewed within the coverage folder.

## Rubocop

Rubocop can be run with the command:

```ruby
# Run rubocop on lib folder
bundle exec rubocop 'lib'

# Run rubcop on all files
bundle exec rubocop
```
