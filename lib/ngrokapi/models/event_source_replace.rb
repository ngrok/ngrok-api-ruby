# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventSourceReplace
      attr_reader :client,
        :attrs,
        :type,
        :filter,
        :fields

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @type = @attrs['type']
        @filter = @attrs['filter']
        @fields = @attrs['fields']
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
