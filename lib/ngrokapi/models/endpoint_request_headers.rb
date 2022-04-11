# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointRequestHeaders
      attr_reader :client,
        :attrs,
        :enabled,
        :add,
        :remove

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @add = @attrs['add']
        @remove = @attrs['remove']
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
