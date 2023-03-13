# frozen_string_literal: true

require 'uri'

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
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
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
