# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class EndpointOIDC
      attr_reader :client,
        :attrs,
        :enabled,
        :options_passthrough,
        :cookie_prefix,
        :inactivity_timeout,
        :maximum_duration,
        :issuer,
        :client_id,
        :client_secret,
        :scopes

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @options_passthrough = @attrs['options_passthrough']
        @cookie_prefix = @attrs['cookie_prefix']
        @inactivity_timeout = @attrs['inactivity_timeout']
        @maximum_duration = @attrs['maximum_duration']
        @issuer = @attrs['issuer']
        @client_id = @attrs['client_id']
        @client_secret = @attrs['client_secret']
        @scopes = @attrs['scopes']
      end

      def ==(other)
        @attrs == other.attrs
      end

      def to_s
        @attrs.to_s
      end

      def to_h
        @attrs.to_h
      end
    end
  end
end
