# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventSourceList
      attr_reader :client,
        :result,
        :sources,
        :uri

      def initialize(client:, result:)
        @client = client
        @result = result
        @sources = @result['sources']
        @uri = @result['uri']
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
