# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventSource
      attr_reader :client,
        :result,
        :type,
        :filter,
        :fields,
        :uri

      def initialize(client:, result:)
        @client = client
        @result = result
        @type = @result['type']
        @filter = @result['filter']
        @fields = @result['fields']
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
