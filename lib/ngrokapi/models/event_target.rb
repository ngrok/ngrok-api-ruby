# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventTarget
      attr_reader :client,
        :attrs,
        :firehose,
        :kinesis,
        :cloudwatch_logs,
        :debug

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @firehose = @attrs['firehose']
        @kinesis = @attrs['kinesis']
        @cloudwatch_logs = @attrs['cloudwatch_logs']
        @debug = @attrs['debug']
      end

      def ==(other)
        @attrs == other.attrs
      end

      def to_s
        @attrs.to_s
      end

      def to_h
        @attrs.to_h
      end
    end
  end
end
