# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointResponseHeaders
      attr_reader :client,
        :result,
        :enabled,
        :add,
        :remove

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @add = @result['add']
        @remove = @result['remove']
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
