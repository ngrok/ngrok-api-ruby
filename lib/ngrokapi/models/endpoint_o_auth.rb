# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class EndpointOAuth
      attr_reader :client,
        :attrs,
        :enabled,
        :provider,
        :options_passthrough,
        :cookie_prefix,
        :inactivity_timeout,
        :maximum_duration,
        :auth_check_interval

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @provider = @attrs['provider']
        @options_passthrough = @attrs['options_passthrough']
        @cookie_prefix = @attrs['cookie_prefix']
        @inactivity_timeout = @attrs['inactivity_timeout']
        @maximum_duration = @attrs['maximum_duration']
        @auth_check_interval = @attrs['auth_check_interval']
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
