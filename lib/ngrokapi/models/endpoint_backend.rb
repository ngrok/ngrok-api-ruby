# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointBackend
      attr_reader :client,
        :result,
        :enabled,
        :backend

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @backend = @result['backend']
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
