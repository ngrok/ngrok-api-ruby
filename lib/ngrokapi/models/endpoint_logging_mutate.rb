# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointLoggingMutate
      attr_reader :client,
        :result,
        :enabled,
        :event_stream_ids

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @event_stream_ids = @result['event_stream_ids']
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
