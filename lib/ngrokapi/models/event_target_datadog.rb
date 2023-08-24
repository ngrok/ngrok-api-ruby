# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class EventTargetDatadog
      attr_reader :client,
        :attrs,
        :api_key,
        :ddtags,
        :service,
        :ddsite

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @api_key = @attrs['api_key']
        @ddtags = @attrs['ddtags']
        @service = @attrs['service']
        @ddsite = @attrs['ddsite']
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
