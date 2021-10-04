# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointLogging
      attr_reader :client,
        :result,
        :enabled,
        :event_streams

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @event_streams = @result['event_streams']
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
