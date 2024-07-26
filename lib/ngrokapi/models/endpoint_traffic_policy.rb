# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class EndpointTrafficPolicy
      attr_reader :client,
        :attrs,
        :enabled,
        :value

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @value = @attrs['value']
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
