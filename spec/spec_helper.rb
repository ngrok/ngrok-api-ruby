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
# NOTE: we should programmatically create these at some point in the future.
def abuse_report_hostname_result
  {
  }
end

def abuse_report_result
  {
  }
end

def agent_ingress_result
  {
    "id" => "agin_1zlnrHlibHAywyAvG5wk0rx5olk",
    "uri" => "https=>//api.ngrok.com/agent_ingresses/agin_1zlnrHlibHAywyAvG5wk0rx5olk",
    "description" => "acme devices",
    "metadata" => "",
    "domain" => "connect.acme.com",
    "ns_targets" => [
      "0.agin_1zlnrHlibHAywyAvG5wk0rx5olk.ns.ngrok.com",
      "1.agin_1zlnrHlibHAywyAvG5wk0rx5olk.ns.ngrok.com",
      "2.agin_1zlnrHlibHAywyAvG5wk0rx5olk.ns.ngrok.com",
      "3.agin_1zlnrHlibHAywyAvG5wk0rx5olk.ns.ngrok.com",
    ],
    "region_domains" => [
      "tunnel.us.connect.acme.com",
    ],
    "created_at" => "2021-10-20T12=>08=>58Z",
  }
end

def agent_ingress_result2
  {
    "id" => "agin_1zlnrHlibHAywyAvG5wk0rx5olk",
    "uri" => "https=>//api.ngrok.com/agent_ingresses/agin_1zlnrHlibHAywyAvG5wk0rx5olk",
    "description" => "ACME Co. Device Ingress",
    "metadata" => "{\"device_sku\"=> \"824JS4RZ1F8X\"}",
    "domain" => "connect.acme.com",
    "ns_targets" => [
      "0.agin_1zlnrHlibHAywyAvG5wk0rx5olk.ns.ngrok.com",
      "1.agin_1zlnrHlibHAywyAvG5wk0rx5olk.ns.ngrok.com",
      "2.agin_1zlnrHlibHAywyAvG5wk0rx5olk.ns.ngrok.com",
      "3.agin_1zlnrHlibHAywyAvG5wk0rx5olk.ns.ngrok.com",
    ],
    "region_domains" => [
      "tunnel.us.connect.acme.com",
    ],
    "created_at" => "2021-10-20T12=>08=>58Z",
  }
end

def agent_ingress_results
  {
    "ingresses" => [
      agent_ingress_result,
      agent_ingress_result2,
    ],
    "uri" => "https://api.ngrok.com/agent_ingresses",
    "next_page_uri" => nil,
  }
end

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

def aws_auth_result
  {
  }
end

def aws_credentials_result
  {
  }
end

def aws_role_result
  {
  }
end

def certificate_authority_result
  {
    "id" => "ca_1rV5DZka5Q6SaX2NwY1rKVOVgA1",
    "uri" => "https://api.ngrok.com/certificate_authorities/ca_1rV5DZka5Q6SaX2NwY1rKVOVgA1",
    "created_at" => "2021-04-21T23:38:17Z",
    "description" => "Device Connectivity Authority",
    "metadata" => "",
    "ca_pem" => "-----BEGIN CERTIFICATE-----\nMIIEAzCCAuugAwIBAgIUGN+Gv4BdJ17VoVXWrz9j51jcfYowDQYJKoZIhvcNAQEL\nBQAwgZAxCzAJBgNVBAYTAlVTMRMwEQYDVQQIDApDYWxpZm9ybmlhMRYwFAYDVQQH\nDA1TYW4gRnJhbmNpc2NvMRMwEQYDVQQKDApBQ01FLCBJbmMuMR4wHAYDVQQDDBVB\nQ01FIERldmljZSBBdXRob3JpdHkxHzAdBgkqhkiG9w0BCQEWEG9wc0BhY21lLmV4\nYW1wbGUwHhcNMjAwNTAxMTYyNTA5WhcNMjEwNTAxMTYyNTA5WjCBkDELMAkGA1UE\nBhMCVVMxEzARBgNVBAgMCkNhbGlmb3JuaWExFjAUBgNVBAcMDVNhbiBGcmFuY2lz\nY28xEzARBgNVBAoMCkFDTUUsIEluYy4xHjAcBgNVBAMMFUFDTUUgRGV2aWNlIEF1\ndGhvcml0eTEfMB0GCSqGSIb3DQEJARYQb3BzQGFjbWUuZXhhbXBsZTCCASIwDQYJ\nKoZIhvcNAQEBBQADggEPADCCAQoCggEBAO8vxADdMmZANJ0aTAX6Jp50vCjFh2/d\nJLxn4ZAg0fFgkM+Zl+3gxGA7YUUKxIKet6rSeyKAjOX9AFA+idpv5mXnD+0nwPDr\nkwGe1MkYsaWYdMyUEoI9uEodS0LmHItAzV63ovkdagb3fqZqWcJCsoDa22WHt6GN\nT2d4xGD0gEMyDmwxey4XYSy63H1mvQRzhjC5wCzTGOefG76Io0whJka0mr3b6wEv\nSw0YqRF0/BEDlmWU/VWz7YEgWpb0rXaLqQKbZjyFo137X1otZK8vj9MVRWRvYmcF\nHgE+n0ifoCQ/DNVF1mkG6HGK3LREj9LGRBTN683Vqq2W+93B9yuTgr8CAwEAAaNT\nMFEwHQYDVR0OBBYEFLGXXIYFIpkRy4j0VsOdfgxgZpXzMB8GA1UdIwQYMBaAFLGX\nXIYFIpkRy4j0VsOdfgxgZpXzMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQEL\nBQADggEBAFyO7ZWj9w6xzoBWu/XbIVwsQ3kE5k+wrRGyp2rh2v4msAEveCIZP5kT\nCSdr2vr+9HQYiKf1ftsp9tGTLXwrhz3ztC8jIqo4A0grw5B61J0lj+2grKNq1/CK\nxQcpkbnetzo4zsDqFRoN2VK40Ovo4b/IknFa38t06b4t8cYQIqUdkFHMSSIz3Mvx\nRIK6MZlilT8zkWhi9kfCJe/s3cVEAJixNkgO4XNo5VhhxFenyvAL2vDM27dWVtDG\nqL3MFZbcy0/74AJsJDSrflGUQxjrK3WI9PkpKp/xey54XJAbhF63z1VwkJwSwufv\nW9HgidfMN9icgxkScyWpB9KrZHcsLk4=\n-----END CERTIFICATE-----\n",
    "subject_common_name" => "ACME Device Authority",
    "not_before" => "2020-05-01T16:25:09Z",
    "not_after" => "2021-05-01T16:25:09Z",
    "key_usages" => [],
    "extended_key_usages" => [],
  }
end

def certificate_authority_result2
  {
    "id" => "ca_1rV5Dca4ELSBvqQv2YmoQp4s220",
    "uri" => "https://api.ngrok.com/certificate_authorities/ca_1rV5Dca4ELSBvqQv2YmoQp4s220",
    "created_at" => "2021-04-21T23:38:17Z",
    "description" => "Internal Coprorates Services Authority",
    "metadata" => "{\"internal_id\" => \"7d2caeee-cdc3-4b26-b2c2-b280b8287552\"}",
    "ca_pem" => "-----BEGIN CERTIFICATE-----\nMIIEETCCAvmgAwIBAgIUU3N6lNzPqar4400cLQMcVHFl+mEwDQYJKoZIhvcNAQEL\nBQAwgZcxCzAJBgNVBAYTAkFVMQwwCgYDVQQIDANOU1cxDzANBgNVBAcMBlN5ZG5l\neTEZMBcGA1UECgwQRHJvcGJlYXIgUHR5IEx0ZDEkMCIGA1UEAwwbSW50cmFuZXQg\nU2VydmljZXMgQXV0aG9yaXR5MSgwJgYJKoZIhvcNAQkBFhlzZWN1cml0eUBkcm9w\nYmVhci5leGFtcGxlMB4XDTIwMDUwMTE2Mjc1OVoXDTIxMDUwMTE2Mjc1OVowgZcx\nCzAJBgNVBAYTAkFVMQwwCgYDVQQIDANOU1cxDzANBgNVBAcMBlN5ZG5leTEZMBcG\nA1UECgwQRHJvcGJlYXIgUHR5IEx0ZDEkMCIGA1UEAwwbSW50cmFuZXQgU2Vydmlj\nZXMgQXV0aG9yaXR5MSgwJgYJKoZIhvcNAQkBFhlzZWN1cml0eUBkcm9wYmVhci5l\neGFtcGxlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7y/EAN0yZkA0\nnRpMBfomnnS8KMWHb90kvGfhkCDR8WCQz5mX7eDEYDthRQrEgp63qtJ7IoCM5f0A\nUD6J2m/mZecP7SfA8OuTAZ7UyRixpZh0zJQSgj24Sh1LQuYci0DNXrei+R1qBvd+\npmpZwkKygNrbZYe3oY1PZ3jEYPSAQzIObDF7LhdhLLrcfWa9BHOGMLnALNMY558b\nvoijTCEmRrSavdvrAS9LDRipEXT8EQOWZZT9VbPtgSBalvStdoupAptmPIWjXftf\nWi1kry+P0xVFZG9iZwUeAT6fSJ+gJD8M1UXWaQbocYrctESP0sZEFM3rzdWqrZb7\n3cH3K5OCvwIDAQABo1MwUTAdBgNVHQ4EFgQUsZdchgUimRHLiPRWw51+DGBmlfMw\nHwYDVR0jBBgwFoAUsZdchgUimRHLiPRWw51+DGBmlfMwDwYDVR0TAQH/BAUwAwEB\n/zANBgkqhkiG9w0BAQsFAAOCAQEANk25tt8sSfn6Qu1bbhWRbjKgS5z+j9LqyCna\nv3fbSchMthaQR7w0vL69ayroeYdqDZkRMmHjuYKY4NyqyXkkaqVO63wEicCo55d9\npIKuPzc/7xwdRephosjGTQ4QaQ4OnrdpJZieI92m9ODexgsab84AYmwNpbGOI/tK\nnPsQr8x1RfLs2gbBwQ4MYVM3tQQbX0o+yve5nz/NCOq4vdG+eKON5u6VYMkOOg9F\nVyNY1iISQkpNk/AF6Vi9BGuDb5Hg0phEl1Q0ntCO7ZHAUHjy0ucqXZiXoXdXZcs3\n3zKKLUKva59EDBZ5TUucvXh8VemBtNc6hd1mX4Tq7lAreG9pjQ==\n-----END CERTIFICATE-----\n",
    "subject_common_name" => "Intranet Services Authority",
    "not_before" => "2020-05-01T16:27:59Z",
    "not_after" => "2021-05-01T16:27:59Z",
    "key_usages" => [],
    "extended_key_usages" => [],
  }
end

def certificate_authority_results
  {
    "certificate_authorities" => [
      certificate_authority_result,
      certificate_authority_result2,
    ],
    "uri" => "https://api.ngrok.com/certificate_authorities",
    "next_page_uri" => nil,
  }
end

def credential_result
  {
    "id" => "cr_1rV53L5Cbhpz2SEyPaMuh3Fz4fN",
    "uri" => "https://api.ngrok.com/credentials/cr_1rV53L5Cbhpz2SEyPaMuh3Fz4fN",
    "created_at" => "2021-04-21T23:36:55Z",
    "description" => "for device #132",
    "metadata" => "",
    "token" => nil,
    "acl" => [
      "bind:1.tcp.ngrok.io:20002",
      "bind:132.devices.company.com",
    ],
  }
end

def credential_result2
  {
    "id" => "cr_1rV53HesDPMw48BJyEO9Zlgz9dd",
    "uri" => "https://api.ngrok.com/credentials/cr_1rV53HesDPMw48BJyEO9Zlgz9dd",
    "created_at" => "2021-04-21T23:36:55Z",
    "description" => "development cred for alan@example.com",
    "metadata" => "",
    "token" => nil,
    "acl" => [],
  }
end

def credential_results
  {
    "credentials" => [
      credential_result,
      credential_result2,
    ],
    "uri" => "https //api.ngrok.com/credentials",
    "next_page_uri" => nil,
  }
end

def endpoint_result
  {
    "id" => "ep_123",
    "region" => "us",
    "created_at" => "2021-04-21T23:36:29Z",
    "updated_at" => "2021-04-21T23:36:29Z",
    "public_url" => "tls://1.tcp.ngrok.io:1234",
    "proto" => "tcp",
    "hostport" => "1.tcp.ngrok.io:1234",
    "type" => "ephemeral",
    "metadata" => "tunnel metadata",
    "domain" => nil,
    "tcp_addr" => { "id": "ra_1024", "uri": "foo" },
    "tunnel" => { "id": "tun_1024", "uri": "foo" },
    "edge" => nil,
  }
end

def endpoint_result2
  {
    "id" => "ep_456",
    "region" => "sa",
    "created_at" => "2021-04-21T23:36:29Z",
    "updated_at" => "2021-04-21T23:36:29Z",
    "public_url" => "https://bugcat.ngrok.io",
    "proto" => "https",
    "hostport" => "bugcat.ngrok.io:443",
    "type" => "persistent",
    "metadata" => "edge metadata",
    "domain" => { "id": "rd_2408", "uri": "quux" },
    "tcp_addr" => nil,
    "tunnel" => nil,
    "edge" => { "id": "edghts_555", "uri": "bar" },
  }
end

def endpoint_results
  {
    "endpoints" => [
      endpoint_result,
      endpoint_result2,
    ],
    "uri" => "https://api.ngrok.com/endpoints",
    "next_page_uri" => nil,
  }
end

def endpoint_compression_result
  {
  }
end

def endpoint_configuration_result
  {
    "id" => "ec_1rV504F3NJD5F9CSDUeWRkld2SB",
    "type" => "https",
    "description" => "app servers",
    "metadata" => "",
    "created_at" => "2021-04-21T23:36:29Z",
    "uri" => "https://api.ngrok.com/endpoint_configurations/ec_1rV504F3NJD5F9CSDUeWRkld2SB",
    "basic_auth" => nil,
    "circuit_breaker" => nil,
    "compression" => nil,
    "request_headers" => {
      "enabled" => true,
      "add" => {
        "x-frontend" => "ngrok",
      },
      "remove" => [
        "cache-control",
      ],
    },
    "response_headers" => nil,
    "ip_policy" => nil,
    "mutual_tls" => nil,
    "tls_termination" => nil,
    "webhook_validation" => nil,
    "oauth" => nil,
    "logging" => nil,
    "saml" => nil,
    "oidc" => nil,
    "backend" => nil,
  }
end

def endpoint_configuration_result2
  {
    "id" => "ec_1rV4zxf7pC5PFpXAcL2A9VLLeGF",
    "type" => "https",
    "description" => "web servers",
    "metadata" => "",
    "created_at" => "2021-04-21T23:36:29Z",
    "uri" => "https://api.ngrok.com/endpoint_configurations/ec_1rV4zxf7pC5PFpXAcL2A9VLLeGF",
    "basic_auth" => nil,
    "circuit_breaker" => {
      "enabled" => true,
      "tripped_duration" => 0,
      "rolling_window" => 0,
      "num_buckets" => 0,
      "volume_threshold" => 0,
      "error_threshold_percentage" => 0.2,
    },
    "compression" => {
      "enabled" => true,
    },
    "request_headers" => nil,
    "response_headers" => {
      "enabled" => true,
      "add" => {
        "content-security-policy" => "script-src 'self'",
        "x-frame-options" => "DENY",
      },
      "remove" => [],
    },
    "ip_policy" => nil,
    "mutual_tls" => nil,
    "tls_termination" => nil,
    "webhook_validation" => nil,
    "oauth" => nil,
    "logging" => nil,
    "saml" => nil,
    "oidc" => nil,
    "backend" => nil,
  }
end

def endpoint_configuration_results
  {
    "endpoint_configurations" => [
      endpoint_configuration_result,
      endpoint_configuration_result2,
    ],
    "uri" => "https://api.ngrok.com/endpoint_configurations",
    "next_page_uri" => nil,
  }
end

def endpoint_circuit_breaker_result
  {
  }
end

def endpoint_ip_policy_result
  {
  }
end

def endpoint_ip_policy_mutate_result
  {
  }
end

def endpoint_logging_result
  {
  }
end

def endpoint_logging_mutate_result
  {
  }
end

def endpoint_mutual_tls_result
  {
  }
end

def endpoint_mutual_tls_mutate_result
  {
  }
end

def endpoint_o_auth_facebook_result
  {
  }
end

def endpoint_o_auth_git_hub_result
  {
  }
end

def endpoint_o_auth_google_result
  {
  }
end

def endpoint_o_auth_microsoft_result
  {
  }
end

def endpoint_o_auth_provider_result
  {
  }
end

def endpoint_o_auth_result
  {
  }
end

def endpoint_oidc_result
  {
  }
end

def endpoint_request_headers_result
  {
  }
end

def endpoint_response_headers_result
  {
  }
end

def endpoint_saml_result
  {
  }
end

def endpoint_saml_mutate_result
  {
  }
end

def endpoint_tls_termination_result
  {
  }
end

def endpoint_webhook_validation_result
  {
  }
end

def event_destination_result
  {
    "id" => "ed_1ro7YLHYTloEfaH6LDcX2A3z18Q",
    "metadata" => "",
    "created_at" => "2021-04-28T17:23:54Z",
    "description" => "",
    "format" => "json",
    "target" => {
      "firehose" => nil,
      "kinesis" => {
        "auth" => {
          "role" => nil,
          "creds" => {
            "aws_access_key_id" => "AKIAIOSFODNN7EXAMPLE",
            "aws_secret_access_key" => nil,
          },
        },
        "stream_arn" => "arn:ngrok-local:kinesis:us-east-2:123456789012:stream/mystream",
      },
      "cloudwatch_logs" => nil,
    },
    "uri" => "https://api.ngrok.com/event_destinations/ed_1ro7YLHYTloEfaH6LDcX2A3z18Q",
  }
end

def event_destination_result2
  {
    "id" => "ed_1ro7aZHBLfa4vYAeRpweVomDSJa",
    "metadata" => "{\"environment\" =>\"dev\"}",
    "created_at" => "2021-04-28T17:24:12Z",
    "description" => "kinesis dev stream",
    "format" => "json",
    "target" => {
      "firehose" => nil,
      "kinesis" => {
        "auth" => {
          "role" => {
            "role_arn" => "arn:aws:iam::123456789012:role/example",
          },
          "creds" => nil,
        },
        "stream_arn" => "arn:ngrok-local:kinesis:us-east-2:123456789012:stream/mystream2",
      },
      "cloudwatch_logs" => nil,
    },
    "uri" => "https://api.ngrok.com/event_destinations/ed_1ro7aZHBLfa4vYAeRpweVomDSJa",
  }
end

def event_destination_results
  {
    "event_destinations" => [
      event_destination_result,
      event_destination_result2,
    ],
    "uri" => "https://api.ngrok.com/event_destinations",
    "next_page_uri" => nil,
  }
end

def event_source_replace_result
  {
  }
end

def event_stream_result
  {
    "id" => "es_1ro7aBEJQkcfUBNX1r3IBSqjDU8",
    "uri" => "https://api.ngrok.com/event_streams/es_1ro7aBEJQkcfUBNX1r3IBSqjDU8",
    "created_at" => "2021-04-28T17:24:09Z",
    "metadata" => "{\"environment\" => \"staging\"}",
    "description" => "low sampling, basic HTTP logs",
    "fields" => [
      "http.request.method",
      "http.response.status_code",
      "conn.client_ip",
    ],
    "event_type" => "http_request_complete",
    "destination_ids" => [
      "ed_1ro7aG1J2tGT6neX0PHJLTuzQ9E",
    ],
    "sampling_rate" => 0.1,
  }
end

def event_stream_result2
  {
    "id" => "es_1ro7YJvY0atyuqOjbLMsZfe928o",
    "uri" => "https://api.ngrok.com/event_streams/es_1ro7YJvY0atyuqOjbLMsZfe928o",
    "created_at" => "2021-04-28T17:23:54Z",
    "metadata" => "",
    "description" => "",
    "fields" => [
      "http.request.method",
      "http.response.status_code",
      "conn.client_ip",
    ],
    "event_type" => "http_request_complete",
    "destination_ids" => [
      "ed_1ro7YLHYTloEfaH6LDcX2A3z18Q",
    ],
    "sampling_rate" => 0.1,
  }
end

def event_stream_results
  {
    "event_streams" => [
      event_stream_result,
      event_stream_result2,
    ],
    "uri" => "https://api.ngrok.com/event_streams",
    "next_page_uri" => nil,
  }
end

def event_source_result
  {
  }
end

def event_source_list_result
  {
    "sources" => [],
    "uri" => "https://api.ngrok.com/event_sources",
  }
end

def event_subscription_result
  {
    "id" => "esb_1ro7av77nFHjRVO7GwDxRE7TElG",
    "uri" => "https://api.ngrok.com/event_subscriptions/esb_1ro7av77nFHjRVO7GwDxRE7TElG",
    "created_at" => "2021-04-28T17:24:15Z",
    "metadata" => "{\"environment\" => \"staging\"}",
    "description" => "low sampling, basic HTTP logs",
    "sources" => [
      {
        "type" => "http_request_complete",
        "uri" => "https://api.ngrok.com/event_subscriptions/esb_1ro7av77nFHjRVO7GwDxRE7TElG/sources/http_request_complete",
      },
    ],
    "destinations" => [
      {
        "id" => "ed_1ro7aylyqQ1LLMWNWrOISvlfveQ",
        "uri" => "https://api.ngrok.com/event_destinations/ed_1ro7aylyqQ1LLMWNWrOISvlfveQ",
      },
    ],
  }
end

def event_subscription_results
  {
    "event_subscriptions" => [
      event_subscription_result,
    ],
    "uri" => "https://api.ngrok.com/event_subscriptions",
    "next_page_uri" => nil,
  }
end

def event_target_cloudwatch_logs_result
  {
  }
end

def event_target_firehose_result
  {
  }
end

def event_target_kinesis_result
  {
  }
end

def event_target_result
  {
  }
end

def ip_policy_result
  {
    "id" => "ipp_1vckSz67sd2iZNRX03t8i8wihdB",
    "uri" => "https://api.ngrok.com/ip_policies/ipp_1vckSz67sd2iZNRX03t8i8wihdB",
    "created_at" => "2021-07-21T11:59:27Z",
    "description" => "Developer Environments",
    "metadata" => "",
    "action" => "allow",
  }
end

def ip_policy_result2
  {
    "id" => "ipp_1vckSvgJ7tjaBIs4w8KZOYQjA7q",
    "uri" => "https://api.ngrok.com/ip_policies/ipp_1vckSvgJ7tjaBIs4w8KZOYQjA7q",
    "created_at" => "2021-07-21T11:59:27Z",
    "description" => "API Outbound Gateway",
    "metadata" => "",
    "action" => "allow",
  }
end

def ip_policy_results
  {
    "ip_policies" => [
      ip_policy_result,
      ip_policy_result2,
    ],
    "uri" => "https://api.ngrok.com/ip_policies",
    "next_page_uri" => nil,
  }
end

def ip_policy_rule_result
  {
    "id" => "ipr_1rV56jFvshOkyVBrKOLNOdd9Jq2",
    "uri" => "https://api.ngrok.com/ip_policy_rules/ipr_1rV56jFvshOkyVBrKOLNOdd9Jq2",
    "created_at" => "2021-04-21T23:37:22Z",
    "description" => "alan laptop",
    "metadata" => "",
    "cidr" => "2.2.2.2/32",
    "ip_policy" => {
      "id" => "ipp_1rV56VrAxesFteoj4XZxaaYyvXo",
      "uri" => "https://api.ngrok.com/ip_policies/ipp_1rV56VrAxesFteoj4XZxaaYyvXo",
    },
  }
end

def ip_policy_rule_result2
  {
    "id" => "ipr_1rV56fKu4NnoTEVfCPSRqE5zRsK",
    "uri" => "https://api.ngrok.com/ip_policy_rules/ipr_1rV56fKu4NnoTEVfCPSRqE5zRsK",
    "created_at" => "2021-04-21T23:37:22Z",
    "description" => "sf office",
    "metadata" => "",
    "cidr" => "132.2.19.0/24",
    "ip_policy" => {
      "id" => "ipp_1rV56VrAxesFteoj4XZxaaYyvXo",
      "uri" => "https://api.ngrok.com/ip_policies/ipp_1rV56VrAxesFteoj4XZxaaYyvXo",
    },
  }
end

def ip_policy_rule_results
  {
    "ip_policy_rules" => [
      ip_policy_rule_result,
      ip_policy_rule_result2,
    ],
    "uri" => "https://api.ngrok.com/ip_policy_rules",
    "next_page_uri" => nil,
  }
end

def ip_restriction_result
  {
    "id" => "ipx_1rV5CKgSrd3y2fosbXX5GoAhMeR",
    "uri" => "https://api.ngrok.com/ip_restrictions/ipx_1rV5CKgSrd3y2fosbXX5GoAhMeR",
    "created_at" => "2021-04-21T23:38:07Z",
    "description" => "",
    "metadata" => "",
    "enforced" => false,
    "type" => "dashboard",
    "ip_policies" => [
      {
        "id" => "ipp_1rV5CMI1Aw8MiqWtjlQCyDDEWnQ",
        "uri" => "https://api.ngrok.com/ip_policies/ipp_1rV5CMI1Aw8MiqWtjlQCyDDEWnQ",
      },
    ],
  }
end

def ip_restriction_results
  {
    "ip_restrictions" => [
      ip_restriction_result,
    ],
    "uri" => "https://api.ngrok.com/ip_restrictions",
    "next_page_uri" => nil,
  }
end

def ref_result
  {
  }
end

def reserved_addr_result
  {
    "id" => "ra_1rV3SMgGd7NuIB89hzucFK8r8nZ",
    "uri" => "https://api.ngrok.com/reserved_addrs/ra_1rV3SMgGd7NuIB89hzucFK8r8nZ",
    "created_at" => "2021-04-21T23:36:49Z",
    "description" => "SSH for device #001",
    "metadata" => "",
    "addr" => "1.tcp.ngrok.io:20011",
    "region" => "us",
    "endpoint_configuration" => nil,
  }
end

def reserved_addr_results
  {
    "reserved_addrs" => [
      reserved_addr_result,
    ],
    "uri" => "https://api.ngrok.com/reserved_addrs",
    "next_page_uri" => nil,
  }
end

def reserved_domain_cert_policy_result
  {
  }
end

def reserved_domain_cert_status_result
  {
  }
end

def reserved_domain_result
  {
    "id" => "rd_1rV51TBbVHrjheFFdfasWnL6E1z",
    "uri" => "https://api.ngrok.com/reserved_domains/rd_1rV51TBbVHrjheFFdfasWnL6E1z",
    "created_at" => "2021-04-21T23:36:41Z",
    "description" => "Device 0001 Dashboard",
    "metadata" => "{\"service\" => \"dashboard\"}",
    "domain" => "manage-0001.app.example.com",
    "region" => "us",
    "cname_target" => "2y4vzpktb.cname.us.ngrok.io",
    "http_endpoint_configuration" => nil,
    "https_endpoint_configuration" => nil,
    "certificate" => nil,
    "certificate_management_policy" => nil,
    "certificate_management_status" => nil,
  }
end

def reserved_domain_result2
  {
    "id" => "rd_1rV51Qr590Jb8MgfiWIxshe0RWs",
    "uri" => "https://api.ngrok.com/reserved_domains/rd_1rV51Qr590Jb8MgfiWIxshe0RWs",
    "created_at" => "2021-04-21T23:36:40Z",
    "description" => "",
    "metadata" => "",
    "domain" => "myapp.mydomain.com",
    "region" => "us",
    "cname_target" => "29flmdbzs.cname.us.ngrok.io",
    "http_endpoint_configuration" => nil,
    "https_endpoint_configuration" => nil,
    "certificate" => {
      "id" => "cert_1rV51OQetZPK9V6vTWUVy3Onjir",
      "uri" => "https://api.ngrok.com/tls_certificates/cert_1rV51OQetZPK9V6vTWUVy3Onjir",
    },
    "certificate_management_policy" => nil,
    "certificate_management_status" => nil,
  }
end

def reserved_domain_results
  {
    "reserved_domains" => [
      reserved_domain_result,
      reserved_domain_result2,
    ],
    "uri" => "https://api.ngrok.com/reserved_domains",
    "next_page_uri" => nil,
  }
end

def reserved_domain_cert_job_result
  {
  }
end

def reserved_domain_cert_ns_target_result
  {
  }
end

def ssh_certificate_authority_result
  {
    "id" => "sshca_1rV5FT4Uy4JaYbMnSyKS3p0xE4f",
    "uri" => "https://api.ngrok.com/ssh_certificate_authorities/sshca_1rV5FT4Uy4JaYbMnSyKS3p0xE4f",
    "created_at" => "2021-04-21T23:38:32Z",
    "description" => "Staging Environment Hosts",
    "metadata" => "",
    "public_key" => "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICDx404hGFBUi7mFqNcd1TkrP4MVtf57kJVP3r0h3rSO",
    "key_type" => "ed25519",
  }
end

def ssh_certificate_authority_results
  {
    "ssh_certificate_authorities" => [
      ssh_certificate_authority_result,
    ],
    "uri" => "https://api.ngrok.com/ssh_certificate_authorities",
    "next_page_uri" => nil,
  }
end

def ssh_credential_result
  {
    "id" => "sshcr_1rV5504YUNgDKQ3WvFOeotnfgNm",
    "uri" => "https://api.ngrok.com/ssh_credentials/sshcr_1rV5504YUNgDKQ3WvFOeotnfgNm",
    "created_at" => "2021-04-21T23:37:09Z",
    "description" => "for device #132",
    "metadata" => "",
    "public_key" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDmGS49FkSODAcKhn3+/47DW2zEn19BZvzRQ8RZjL3v6hCIX2qXfsFK35EGxNI0wV23H4xXC2gVRPHKU71YnCb50tad3yMBTM6+2yfGsEDasEH/anmBLclChKvuGiT547RskZlpbAbdq3GvbzmY+R/2EBRMOiObpc8XmSzKAd05j28kqN0+rZO65SWId0MXdvJdSCSAnuRqBNd/aXKlu8hBPDcgwbT2lMkuR+ApoBS2FLRBOiQyt2Ol0T7Uuf7lTLlazpGB3uTw5zFYUNXkuuI6cAP8QYuY1Bne/hNrG8t3Aw9a1yc2C4Fz1hJ/4OMRxTQ8SUQf+Rmxs8DryMlMFJ8r device132@example.com",
    "acl" => [
      "bind:1.tcp.ngrok.io:20002",
      "bind:132.devices.company.com",
    ],
  }
end

def ssh_credential_results
  {
    "ssh_credentials" => [
      ssh_credential_result,
    ],
    "uri" => "https://api.ngrok.com/ssh_credentials",
    "next_page_uri" => nil,
  }
end

def ssh_host_certificate_result
  {
    "id" => "shcrt_1rV5GnCIHgKW4OyBIjKSqpbaf04",
    "uri" => "https://api.ngrok.com/ssh_host_certificates/shcrt_1rV5GnCIHgKW4OyBIjKSqpbaf04",
    "created_at" => "2021-04-21T23:38:42Z",
    "description" => "personal server",
    "metadata" => "",
    "public_key" => "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBI3oSgxrOEJ+tIJ/n6VYtxQIFvynqlOHpfOAJ4x4OfmMYDkbf8dr6RAuUSf+ZC2HMCujta7EjZ9t+6v08Ue+Cgk= inconshreveable.com",
    "key_type" => "ecdsa",
    "ssh_certificate_authority_id" => "sshca_1rV5GiTaiBQg8AtJiyiVeNKzYiR",
    "principals" => [
      "inconshreveable.com",
      "10.2.42.9",
    ],
    "valid_after" => "2021-04-21T23:38:42Z",
    "valid_until" => "2021-07-20T23:38:42Z",
    "certificate" => "ecdsa-sha2-nistp256-cert-v01@openssh.com AAAAKGVjZHNhLXNoYTItbmlzdHAyNTYtY2VydC12MDFAb3BlbnNzaC5jb20AAAAgl+i7u7P1mVEWv2Igcf76hXPS2/xnKniDnJZX53xfuTQAAAAIbmlzdHAyNTYAAABBBI3oSgxrOEJ+tIJ/n6VYtxQIFvynqlOHpfOAJ4x4OfmMYDkbf8dr6RAuUSf+ZC2HMCujta7EjZ9t+6v08Ue+CgkAAAAAAAAAAAAAAAIAAAAhc2hjcnRfMXJWNUduQ0lIZ0tXNE95QklqS1NxcGJhZjA0AAAAJAAAABNpbmNvbnNocmV2ZWFibGUuY29tAAAACTEwLjIuNDIuOQAAAABggLeCAAAAAGD3XoIAAAAAAAAAAAAAAAAAAAAzAAAAC3NzaC1lZDI1NTE5AAAAIEpsciWkhlFN7VFWGMkSy1xFNwuZLVh7ZE/uo79NWH8LAAAAUwAAAAtzc2gtZWQyNTUxOQAAAECJHCycrdAf2WNjWGWolP+Y5TlIm5LX4TdRJFeSdUVp0amDg9ZYRltqXy61qGVc43G/unqz35ZzkwJPmVAi/ZQL shcrt_1rV5GnCIHgKW4OyBIjKSqpbaf04",
  }
end

def ssh_host_certificate_results
  {
    "ssh_host_certificates" => [
      ssh_host_certificate_result,
    ],
    "uri" => "https://api.ngrok.com/ssh_host_certificates",
    "next_page_uri" => nil,
  }
end

def ssh_user_certificate_result
  {
    "id" => "sucrt_1rV5G8jarzhIEEQTv1wXRE1KRU1",
    "uri" => "https://api.ngrok.com/ssh_user_certificates/sucrt_1rV5G8jarzhIEEQTv1wXRE1KRU1",
    "created_at" => "2021-04-21T23:38:37Z",
    "description" => "temporary access to staging machine",
    "metadata" => "",
    "public_key" => "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBK58lFzmWlDimDtBz78wVT4oauA8PjY0CiXTCEIsBNC6UwOJvZ0jdSaYNhDaa7dRV84DfBb/gKzqlXC7cVMZjl0= alan@work-laptop",
    "key_type" => "ecdsa",
    "ssh_certificate_authority_id" => "sshca_1rV5G33U0TV5AFqiEfKcjOi8W4t",
    "principals" => [
      "ec2-user",
      "root",
    ],
    "critical_options" => {},
    "extensions" => {
      "permit-pty" => "",
      "permit-user-rc" => "",
    },
    "valid_after" => "2021-04-21T23:38:37Z",
    "valid_until" => "2021-07-20T23:38:37Z",
    "certificate" => "ecdsa-sha2-nistp256-cert-v01@openssh.com AAAAKGVjZHNhLXNoYTItbmlzdHAyNTYtY2VydC12MDFAb3BlbnNzaC5jb20AAAAgMQgYZDmRzsM+dcF5rZZM5/xHEFNygLtRKq7Ycsjvk+0AAAAIbmlzdHAyNTYAAABBBK58lFzmWlDimDtBz78wVT4oauA8PjY0CiXTCEIsBNC6UwOJvZ0jdSaYNhDaa7dRV84DfBb/gKzqlXC7cVMZjl0AAAAAAAAAAAAAAAEAAAAhc3VjcnRfMXJWNUc4amFyemhJRUVRVHYxd1hSRTFLUlUxAAAAFAAAAAhlYzItdXNlcgAAAARyb290AAAAAGCAt30AAAAAYPdefQAAAAAAAAAoAAAACnBlcm1pdC1wdHkAAAAAAAAADnBlcm1pdC11c2VyLXJjAAAAAAAAAAAAAAAzAAAAC3NzaC1lZDI1NTE5AAAAICskbrMYess7OemvQlCikleCUq+2lkxesOd8ivjoWlNCAAAAUwAAAAtzc2gtZWQyNTUxOQAAAEA6yhx0v0tzSsQaCQez/qwL8QO+ZLLvKhfmcQ53I0bSYxSaf6G7n8uLThk4OVtq/QJdVaWNcfLrLY0ipITz1RAK sucrt_1rV5G8jarzhIEEQTv1wXRE1KRU1",
  }
end

def ssh_user_certificate_results
  {
    "ssh_user_certificates" => [
      ssh_user_certificate_result,
    ],
    "uri" => "https://api.ngrok.com/ssh_user_certificates",
    "next_page_uri" => nil,
  }
end

def tls_certificate_result
  {
    "id" => "cert_1rV51OQetZPK9V6vTWUVy3Onjir",
    "uri" => "https://api.ngrok.com/tls_certificates/cert_1rV51OQetZPK9V6vTWUVy3Onjir",
    "created_at" => "2021-04-21T23:36:40Z",
    "description" => "",
    "metadata" => "",
    "certificate_pem" => "-----BEGIN CERTIFICATE-----\nMIIDDTCCAfWgAwIBAgIUBUunDdA4gjgtEbZA8w9Ljhvl3bEwDQYJKoZIhvcNAQEL\nBQAwFjEUMBIGA1UEAwwLZXhhbXBsZS5jb20wHhcNMjAwMzI0MTgxODE5WhcNMjAw\nNDIzMTgxODE5WjAWMRQwEgYDVQQDDAtleGFtcGxlLmNvbTCCASIwDQYJKoZIhvcN\nAQEBBQADggEPADCCAQoCggEBAPKVkkKYNl3d9cqrz4tIFlwsohED5W4y1dcBixy4\nGANFFnw43nc2wPyKwYXumJqJIFrcW/NkUZL07bd+dou6mT6Gh/zbaTW91IkREPXL\n7b3KfVu4XkFosVXpWs0U6o4GrZ81CLiKBWI+H03x/ij5OSiJ1l71pqLeTJLOydAR\nAl8kpp7axeHU4UbDrAZkW5SnuZTjIKwVg0UNsBg1yNfUOu1Uah3BYaqPgQitC0Yg\nLW+NUGu/T91bkD7tLsVInkQXeQGdXBAqOycfJ7wj8OlIpyuXjTnGFA0izVmbQw5f\nrQnZ0geGyhLamvz9Gcd7mIlD/+/AEN9Lht82tAOzKG98/O8CAwEAAaNTMFEwHQYD\nVR0OBBYEFKv6RsvEC6T+zCtJZwB0FCR1sEkhMB8GA1UdIwQYMBaAFKv6RsvEC6T+\nzCtJZwB0FCR1sEkhMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEB\nAC5fBrouinespo5+9AipjhY/HOKTg+OCnppFnSnqeU1eXZZJ0oakdHTpTNxtbQP9\ntOJTA2f3KWvmpNDMohEQXZz8wHDkdbrIXJKVp6zs1pEp+0BIjA4y9mSywa5xuyk0\noGeChRgGqp2JujDyPCb7LEaKKQEEdMqy73QG+jEAh14+wKixlAf1nATBdeCUvssK\n2x1uZMyqjJFB5y/5EdnWQzD4WJkrsCkxsZHVMN1d+dqf2sf3dTRV8fzsFGOG17NS\n6u2n9iGcFdBA82XN8yeLIWhy1t3GWutG1sdxENbFRRXea+iUqzDsmRtkaBma2GLQ\nd6JTpFbsCtwDjP23UEi7SZo=\n-----END CERTIFICATE-----\n",
    "subject_common_name" => "example.com",
    "subject_alternative_names" => {
      "dns_names" => [],
      "ips" => [],
    },
    "issued_at" => nil,
    "not_before" => "2020-03-24T18:18:19Z",
    "not_after" => "2020-04-23T18:18:19Z",
    "key_usages" => [],
    "extended_key_usages" => [],
    "private_key_type" => "rsa",
    "issuer_common_name" => "example.com",
    "serial_number" => "054ba70dd03882382d11b640f30f4b8e1be5ddb1",
    "subject_organization" => "",
    "subject_organizational_unit" => "",
    "subject_locality" => "",
    "subject_province" => "",
    "subject_country" => "",
  }
end

def tls_certificate_result2
  {
    "id" => "cert_1rV5D0Ur3PklEGZwRj9m6qCBlCc",
    "uri" => "https://api.ngrok.com/tls_certificates/cert_1rV5D0Ur3PklEGZwRj9m6qCBlCc",
    "created_at" => "2021-04-21T23:38:12Z",
    "description" => "",
    "metadata" => "",
    "certificate_pem" => "-----BEGIN CERTIFICATE-----\nMIIDDTCCAfWgAwIBAgIUBUunDdA4gjgtEbZA8w9Ljhvl3bEwDQYJKoZIhvcNAQEL\nBQAwFjEUMBIGA1UEAwwLZXhhbXBsZS5jb20wHhcNMjAwMzI0MTgxODE5WhcNMjAw\nNDIzMTgxODE5WjAWMRQwEgYDVQQDDAtleGFtcGxlLmNvbTCCASIwDQYJKoZIhvcN\nAQEBBQADggEPADCCAQoCggEBAPKVkkKYNl3d9cqrz4tIFlwsohED5W4y1dcBixy4\nGANFFnw43nc2wPyKwYXumJqJIFrcW/NkUZL07bd+dou6mT6Gh/zbaTW91IkREPXL\n7b3KfVu4XkFosVXpWs0U6o4GrZ81CLiKBWI+H03x/ij5OSiJ1l71pqLeTJLOydAR\nAl8kpp7axeHU4UbDrAZkW5SnuZTjIKwVg0UNsBg1yNfUOu1Uah3BYaqPgQitC0Yg\nLW+NUGu/T91bkD7tLsVInkQXeQGdXBAqOycfJ7wj8OlIpyuXjTnGFA0izVmbQw5f\nrQnZ0geGyhLamvz9Gcd7mIlD/+/AEN9Lht82tAOzKG98/O8CAwEAAaNTMFEwHQYD\nVR0OBBYEFKv6RsvEC6T+zCtJZwB0FCR1sEkhMB8GA1UdIwQYMBaAFKv6RsvEC6T+\nzCtJZwB0FCR1sEkhMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEB\nAC5fBrouinespo5+9AipjhY/HOKTg+OCnppFnSnqeU1eXZZJ0oakdHTpTNxtbQP9\ntOJTA2f3KWvmpNDMohEQXZz8wHDkdbrIXJKVp6zs1pEp+0BIjA4y9mSywa5xuyk0\noGeChRgGqp2JujDyPCb7LEaKKQEEdMqy73QG+jEAh14+wKixlAf1nATBdeCUvssK\n2x1uZMyqjJFB5y/5EdnWQzD4WJkrsCkxsZHVMN1d+dqf2sf3dTRV8fzsFGOG17NS\n6u2n9iGcFdBA82XN8yeLIWhy1t3GWutG1sdxENbFRRXea+iUqzDsmRtkaBma2GLQ\nd6JTpFbsCtwDjP23UEi7SZo=\n-----END CERTIFICATE-----\n",
    "subject_common_name" => "example.com",
    "subject_alternative_names" => {
      "dns_names" => [],
      "ips" => [],
    },
    "issued_at" => nil,
    "not_before" => "2020-03-24T18:18:19Z",
    "not_after" => "2020-04-23T18:18:19Z",
    "key_usages" => [],
    "extended_key_usages" => [],
    "private_key_type" => "rsa",
    "issuer_common_name" => "example.com",
    "serial_number" => "054ba70dd03882382d11b640f30f4b8e1be5ddb1",
    "subject_organization" => "",
    "subject_organizational_unit" => "",
    "subject_locality" => "",
    "subject_province" => "",
    "subject_country" => "",
  }
end

def tls_certificate_results
  {
    "tls_certificates" => [
      tls_certificate_result,
      tls_certificate_result2,
    ],
    "uri" => "https://api.ngrok.com/tls_certificates",
    "next_page_uri" => nil,
  }
end

def tls_certificate_sa_ns_result
  {
  }
end

def tunnel_result
  {
    "id" => "tn_1rV53vIXMKFIfPxXVWbW2sf4OLW",
    "public_url" => "http://57ae41e8cfac.ngrok.io",
    "started_at" => "2021-04-21T23:37:00Z",
    "metadata" => "",
    "proto" => "http",
    "region" => "us",
    "tunnel_session" => {
      "id" => "ts_1rV53yu42s8Hb17NxYNmXLDy8zR",
      "uri" => "https://api.ngrok.com/tunnel_sessions/ts_1rV53yu42s8Hb17NxYNmXLDy8zR",
    },
  }
end

def tunnel_result2
  {
    "id" => "tn_1rV53wi3OtUfY1RbkH2vNsTmLcO",
    "public_url" => "https://57ae41e8cfac.ngrok.io",
    "started_at" => "2021-04-21T23:37:00Z",
    "metadata" => "",
    "proto" => "https",
    "region" => "us",
    "tunnel_session" => {
      "id" => "ts_1rV53yu42s8Hb17NxYNmXLDy8zR",
      "uri" => "https://api.ngrok.com/tunnel_sessions/ts_1rV53yu42s8Hb17NxYNmXLDy8zR",
    },
  }
end

def tunnel_results
  {
    "tunnels" => [
      tunnel_result,
      tunnel_result2,
    ],
    "uri" => "https://api.ngrok.com/tunnels",
    "next_page_uri" => nil,
  }
end

def tunnel_session_result
  {
    "agent_version" => "",
    "credential" => {
      "id" => "cr_1rV54BnShBhgmZvLtZKAOJhI7jR",
      "uri" => "https://api.ngrok.com/credentials/cr_1rV54BnShBhgmZvLtZKAOJhI7jR",
    },
    "id" => "ts_1rV549gK2e0WnE8Wvk3ab32e98U",
    "ip" => "10.42.0.63",
    "metadata" => "",
    "os" => "linux",
    "region" => "us",
    "started_at" => "2021-04-21T23:37:02Z",
    "transport" => "ngrok/2",
    "uri" => "https://api.ngrok.com/tunnel_sessions/ts_1rV549gK2e0WnE8Wvk3ab32e98U",
  }
end

def tunnel_session_results
  {
    "tunnel_sessions" => [
      tunnel_session_result,
    ],
    "uri" => "https://api.ngrok.com/tunnel_sessions",
    "next_page_uri" => nil,
  }
end

def endpoint_backend_mutate_result
  {
    "enabled" => true,
    "backend_id" => "bkdhr_23ejDsgFClTHtGtzdbcNzkr2DvA",
  }
end

def endpoint_backend_result
  {
    "enabled" => true,
    "backend" => {
      "id" => "bkdfo_23WYoC8ApDQQpNeaqhvzQD25RVx",
      "uri" => "https://api.ngrok.com/backends/failover/bkdfo_23WYoC8ApDQQpNeaqhvzQD25RVx",
    },
  }
end

def endpoint_tls_termination_at_edge_result
  {
    "enabled" => true,
    "min_version" => nil,
  }
end

def endpoint_websocket_tcp_converter_result
  {
    "enabled" => true,
  }
end

def https_edge_result
  {
    "id" => "edghts_23WYoHa6cZpqNFOr7nuDEsaN9SG",
    "description" => "",
    "metadata" => "",
    "created_at" => "2021-10-20T12=>08=>58Z",
    "uri" => "https://api.ngrok.com/edges/https/edghts_23WYoHa6cZpqNFOr7nuDEsaN9SG",
    "hostports" => [
      "example.ngrok.io:443",
    ],
    "mutual_tls" => nil,
    "tls_termination" => nil,
    "routes" => nil,
  }
end

def https_edge_result2
  {
    "id" => "edghts_23f9iVEEQPCXa54Ob3s0M9t8cq8",
    "description" => "",
    "metadata" => "",
    "created_at" => "2021-10-20T12=>08=>58Z",
    "uri" => "https://api.ngrok.com/edges/https/edghts_23f9iVEEQPCXa54Ob3s0M9t8cq8",
    "hostports" => [
      "example.ngrok.io:443",
    ],
    "mutual_tls" => nil,
    "tls_termination" => nil,
    "routes" => nil,
  }
end

def https_edge_results
  {
    "https_edges" => [
      https_edge_result,
      https_edge_result2,
    ],
    "uri" => "https://api.ngrok.com/edges/https",
    "next_page_uri" => nil,
  }
end

def https_edge_route_result
  {
    "id" => "edghtsrt_23WZ2wMQh9ZV0gPcToseRIIUJQo",
    "description" => "",
    "metadata" => "",
    "created_at" => "2021-10-20T12=>08=>58Z",
    "edge_id" => "edghts_23WYoHa6cZpqNFOr7nuDEsaN9SG",
    "match_type" => "path_prefix",
    "match" => "/",
    "uri" => "https://api.ngrok.com/edges/https/edghts_23WYoHa6cZpqNFOr7nuDEsaN9SG/routes/edghtsrt_23WZ2wMQh9ZV0gPcToseRIIUJQo",
    "backend" => nil,
    "ip_restriction" => nil,
    "circuit_breaker" => nil,
    "compression" => nil,
    "request_headers" => nil,
    "response_headers" => nil,
    "webhook_validation" => nil,
    "oauth" => nil,
    "saml" => nil,
    "oidc" => nil,
    "websocket_tcp_converter" => nil,
  }
end

def tcp_edge_result
  {
    "id" => "edgtcp_23f9bWP6gWuwWVhhXXZJd87khPr",
    "description" => "",
    "metadata" => "",
    "created_at" => "2021-10-20T12=>08=>58Z",
    "uri" => "https://api.ngrok.com/edges/tcp/edgtcp_23f9bWP6gWuwWVhhXXZJd87khPr",
    "hostports" => [
      "1.tcp.ngrok.io:20033",
    ],
    "backend" => nil,
    "ip_restriction" => nil,
  }
end

def tcp_edge_result2
  {
    "id" => "edgtcp_23fAbCNhQWBW7jaAEHIwNjN0psq",
    "description" => "",
    "metadata" => "",
    "created_at" => "2021-10-20T12=>08=>58Z",
    "uri" => "https://api.ngrok.com/edges/tcp/edgtcp_23fAbCNhQWBW7jaAEHIwNjN0psq",
    "hostports" => [
      "1.tcp.ngrok.io:20034",
    ],
    "backend" => nil,
    "ip_restriction" => nil,
  }
end

def tcp_edge_results
  {
    "tcp_edges" => [
      tcp_edge_result,
      tcp_edge_result2,
    ],
    "uri" => "https://api.ngrok.com/edges/tcp",
    "next_page_uri" => nil,
  }
end

def tls_edge_result
  {
    "id" => "edgtls_23fAtcj1nEUtNOvCHTmw2p7boPq",
    "description" => "",
    "metadata" => "",
    "created_at" => "2021-10-20T12=>08=>58Z",
    "uri" => "https://api.ngrok.com/edges/tls/edgtls_23fAtcj1nEUtNOvCHTmw2p7boPq",
    "hostports" => [
      "q3n1rmaj.ngrok.io:443",
    ],
    "backend" => nil,
    "ip_restriction" => nil,
    "mutual_tls" => nil,
    "tls_termination" => nil,
  }
end

def tls_edge_result2
  {
    "id" => "edgtls_23fB67XVniqMYnmzMHJCGDjlNTh",
    "description" => "",
    "metadata" => "",
    "created_at" => "2021-10-20T12=>08=>58Z",
    "uri" => "https://api.ngrok.com/edges/tls/edgtls_23fB67XVniqMYnmzMHJCGDjlNTh",
    "hostports" => [
      "q3n1rmaj.ngrok.io:443",
    ],
    "backend" => nil,
    "ip_restriction" => nil,
    "mutual_tls" => nil,
    "tls_termination" => nil,
  }
end

def tls_edge_results
  {
    "tls_edges" => [
      tls_edge_result,
      tls_edge_result2,
    ],
    "uri" => "https://api.ngrok.com/edges/tls",
    "next_page_uri" => nil,
  }
end

def tunnel_group_backend_result
  {
    "id" => "bkdtg_23wBji94nFzDEouYAo3QHYWLmKH",
    "uri" => "https://api.ngrok.com/backends/tunnel_group/bkdtg_23wBji94nFzDEouYAo3QHYWLmKH",
    "created_at" => "2022-01-19T23:36:45Z",
    "description" => "acme tunnel group",
    "metadata" => "{\"environment\" => \"staging\"}",
    "labels" => {
      "baz" => "qux",
      "foo" => "bar",
    },
  }
end

def tunnel_group_backend_results
  {
    "backends" => [
      tunnel_group_backend_result,
    ],
    "uri" => "https://api.ngrok.com/backends/tunnel_group",
    "next_page_uri" => nil,
  }
end

def http_response_backend_result
  {
    "id" => "bkdhr_23wBjkemewVLpsBfzIsBkzgaE3A",
    "uri" => "https://api.ngrok.com/backends/http_response/bkdhr_23wBjkemewVLpsBfzIsBkzgaE3A",
    "created_at" => "2022-01-19T23:36:45Z",
    "description" => "acme http response",
    "metadata" => "{\"environment\" => \"staging\"}",
    "body" => "I'm a teapot",
    "headers" => {
      "content-type" => "text/plain",
    },
    "status_code" => 418,
  }
end

def http_response_backend_results
  {
    "backends" => [
      http_response_backend_result,
    ],
    "uri" => "https://api.ngrok.com/backends/http_response",
    "next_page_uri" => nil,
  }
end

def failover_backend_result
  {
    "id" => "bkdfo_23wBjiMhF0HaPfF98vQrdWmscai",
    "uri" => "https://api.ngrok.com/backends/failover/bkdfo_23wBjiMhF0HaPfF98vQrdWmscai",
    "created_at" => "2022-01-19T23:36:45Z",
    "description" => "acme failover",
    "metadata" => "{\"environment\" => \"staging\"}",
    "backends" => [
      "bkdhr_23wBjgJYO3hKSpkaIrDQ5HQE2jY",
    ],
  }
end

def failover_backend_results
  {
    "backends" => [
      failover_backend_result,
    ],
    "uri" => "https://api.ngrok.com/backends/failover",
    "next_page_uri" => nil,
  }
end

def weighted_backend_result
  {
    "id" => "bkdwd_23wBjgO2sn7WFHs8269Xrdv2yXw",
    "uri" => "https://api.ngrok.com/backends/weighted/bkdwd_23wBjgO2sn7WFHs8269Xrdv2yXw",
    "created_at" => "2022-01-19T23:36:45Z",
    "description" => "acme weighted",
    "metadata" => "{\"environment\" => \"staging\"}",
    "backends" => {
      "bkdhr_23wBjgkCq2PEYfrOjKBqQY3hy9B" => 0,
      "bkdhr_23wBjiPnTqyUosGG2pdP2VWXxlx" => 1,
    },
  }
end

def weighted_backend_results
  {
    "backends" => [
      weighted_backend_result,
    ],
    "uri" => "https://api.ngrok.com/backends/weighted",
    "next_page_uri" => nil,
  }
end
