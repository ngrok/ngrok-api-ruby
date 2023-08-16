# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'uri'

module NgrokAPI
  module Models
    class EventSource
      attr_reader :client,
        :attrs,
        :type,
        :filter,
        :fields,
        :uri

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @type = @attrs['type']
        @filter = @attrs['filter']
        @fields = @attrs['fields']
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
