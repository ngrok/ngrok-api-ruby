# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class EventTargetAzureLogsIngestion
      attr_reader :client,
        :attrs,
        :tenant_id,
        :client_id,
        :client_secret,
        :logs_ingestion_uri,
        :data_collection_rule_id,
        :data_collection_stream_name

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @tenant_id = @attrs['tenant_id']
        @client_id = @attrs['client_id']
        @client_secret = @attrs['client_secret']
        @logs_ingestion_uri = @attrs['logs_ingestion_uri']
        @data_collection_rule_id = @attrs['data_collection_rule_id']
        @data_collection_stream_name = @attrs['data_collection_stream_name']
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
