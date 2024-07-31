# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class EventTarget
      attr_reader :client,
        :attrs,
        :firehose,
        :kinesis,
        :cloudwatch_logs,
        :datadog,
        :azure_logs_ingestion

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @firehose = @attrs['firehose']
        @kinesis = @attrs['kinesis']
        @cloudwatch_logs = @attrs['cloudwatch_logs']
        @datadog = @attrs['datadog']
        @azure_logs_ingestion = @attrs['azure_logs_ingestion']
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
