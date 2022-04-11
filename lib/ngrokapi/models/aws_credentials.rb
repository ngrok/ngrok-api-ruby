# frozen_string_literal: true

module NgrokAPI
  module Models
    class AWSCredentials
      attr_reader :client,
        :attrs,
        :aws_access_key_id,
        :aws_secret_access_key

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @aws_access_key_id = @attrs['aws_access_key_id']
        @aws_secret_access_key = @attrs['aws_secret_access_key']
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
