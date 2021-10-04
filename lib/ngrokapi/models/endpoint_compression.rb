# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointCompression
      attr_reader :client,
        :result,
        :enabled

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
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
