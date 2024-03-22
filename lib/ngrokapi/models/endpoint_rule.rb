# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class EndpointRule
      attr_reader :client,
        :attrs,
        :expressions,
        :actions,
        :name

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @expressions = @attrs['expressions']
        @actions = @attrs['actions']
        @name = @attrs['name']
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
