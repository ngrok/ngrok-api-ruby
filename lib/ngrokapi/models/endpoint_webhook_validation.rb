# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointWebhookValidation
      attr_reader :client,
        :result,
        :enabled,
        :provider,
        :secret

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @provider = @result['provider']
        @secret = @result['secret']
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
