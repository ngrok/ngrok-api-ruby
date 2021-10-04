# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventTarget
      attr_reader :client,
        :result,
        :firehose,
        :kinesis,
        :cloudwatch_logs,
        :debug

      def initialize(client:, result:)
        @client = client
        @result = result
        @firehose = @result['firehose']
        @kinesis = @result['kinesis']
        @cloudwatch_logs = @result['cloudwatch_logs']
        @debug = @result['debug']
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
