# frozen_string_literal: true

module NgrokAPI
  module Models
    class AWSAuth
      attr_reader :client,
        :attrs,
        :role,
        :creds

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @role = @attrs['role']
        @creds = @attrs['creds']
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
