# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointWebhookValidation
      attr_reader :client,
        :attrs,
        :enabled,
        :provider,
        :secret

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @provider = @attrs['provider']
        @secret = @attrs['secret']
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
