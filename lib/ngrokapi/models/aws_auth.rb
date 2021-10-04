# frozen_string_literal: true

module NgrokAPI
  module Models
    class AWSAuth
      attr_reader :client,
        :result,
        :role,
        :creds

      def initialize(client:, result:)
        @client = client
        @result = result
        @role = @result['role']
        @creds = @result['creds']
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
