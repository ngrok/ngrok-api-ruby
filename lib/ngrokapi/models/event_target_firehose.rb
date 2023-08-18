# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class EventTargetFirehose
      attr_reader :client,
        :attrs,
        :auth,
        :delivery_stream_arn

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @auth = @attrs['auth']
        @delivery_stream_arn = @attrs['delivery_stream_arn']
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
