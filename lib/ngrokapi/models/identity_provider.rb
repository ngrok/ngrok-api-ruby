# frozen_string_literal: true

module NgrokAPI
  module Models
    class IdentityProvider
      attr_reader :client,
        :attrs,
        :name,
        :url

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @name = @attrs['name']
        @url = @attrs['url']
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
