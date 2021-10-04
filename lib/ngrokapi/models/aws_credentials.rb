# frozen_string_literal: true

module NgrokAPI
  module Models
    class AWSCredentials
      attr_reader :client,
        :result,
        :aws_access_key_id,
        :aws_secret_access_key

      def initialize(client:, result:)
        @client = client
        @result = result
        @aws_access_key_id = @result['aws_access_key_id']
        @aws_secret_access_key = @result['aws_secret_access_key']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end
    end
  end
end
