# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointOAuthProvider
      attr_reader :client,
        :attrs,
        :github,
        :facebook,
        :microsoft,
        :google

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @github = @attrs['github']
        @facebook = @attrs['facebook']
        @microsoft = @attrs['microsoft']
        @google = @attrs['google']
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
