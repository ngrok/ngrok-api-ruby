# frozen_string_literal: true

module NgrokAPI
  module Models
    class AWSRole
      attr_reader :client,
        :result,
        :role_arn

      def initialize(client:, result:)
        @client = client
        @result = result
        @role_arn = @result['role_arn']
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
