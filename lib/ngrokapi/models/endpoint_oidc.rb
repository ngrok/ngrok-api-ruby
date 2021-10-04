# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointOIDC
      attr_reader :client,
        :result,
        :enabled,
        :options_passthrough,
        :cookie_prefix,
        :inactivity_timeout,
        :maximum_duration,
        :issuer,
        :client_id,
        :client_secret,
        :scopes

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @options_passthrough = @result['options_passthrough']
        @cookie_prefix = @result['cookie_prefix']
        @inactivity_timeout = @result['inactivity_timeout']
        @maximum_duration = @result['maximum_duration']
        @issuer = @result['issuer']
        @client_id = @result['client_id']
        @client_secret = @result['client_secret']
        @scopes = @result['scopes']
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
