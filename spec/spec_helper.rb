# frozen_string_literal: true

require "simplecov"
SimpleCov.start
require 'pry'

require 'webmock/rspec'
require './lib/ngrokapi'

Dir[File.expand_path(File.join(File.dirname(__FILE__), 'support', '**', '*.rb'))].each do |f|
  require f
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = false
  end

  config.run_all_when_everything_filtered = true

  config.disable_monkey_patching!

  config.warnings = true

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end

RSpec::Matchers.define :use_ssl do
  match(&:use_ssl?)
end

RSpec::Matchers.define :use_cert_store do |cert_store|
  match do |connection|
    connection.cert_store == cert_store
  end
end

# Custom objects
def api_key_result
  {
    "id" => "ak_1xrq8h890dWRYiRdIHeZYCdlyT7",
    "uri" => "https://api.ngrok.com/api_keys/ak_1xrq8h890dWRYiRdIHeZYCdlyT7",
    "description" => "",
    "metadata" => "",
    "created_at" => "2021-09-08T17:49:56Z",
    "token" => nil,
  }
end

def api_key_result2
  {
    "id" => "ak_1xrqAsg8fMHBgD71MSbtr6a0pA2",
    "uri" => "https://api.ngrok.com/api_keys/ak_1xrqAsg8fMHBgD71MSbtr6a0pA2",
    "description" => "",
    "metadata" => "",
    "created_at" => "2021-09-08T17:50:14Z",
    "token" => nil,
  }
end

def api_key_results
  {
    "keys" => [
      api_key_result,
      api_key_result2,
    ],
    "uri" => "https://api.ngrok.com/api_keys",
    "next_page_uri" => nil,
  }
end
