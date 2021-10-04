# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointOAuth
      attr_reader :client,
        :result,
        :enabled,
        :provider,
        :options_passthrough,
        :cookie_prefix,
        :inactivity_timeout,
        :maximum_duration,
        :auth_check_interval

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @provider = @result['provider']
        @options_passthrough = @result['options_passthrough']
        @cookie_prefix = @result['cookie_prefix']
        @inactivity_timeout = @result['inactivity_timeout']
        @maximum_duration = @result['maximum_duration']
        @auth_check_interval = @result['auth_check_interval']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end
    end
  end
end
