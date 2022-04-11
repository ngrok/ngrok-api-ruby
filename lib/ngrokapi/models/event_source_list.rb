# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventSourceList
      attr_reader :client,
        :attrs,
        :sources,
        :uri

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @sources = @attrs['sources']
        @uri = @attrs['uri']
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
