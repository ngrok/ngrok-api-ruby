# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class AbuseReportHostname
      attr_reader :client,
        :attrs,
        :hostname,
        :status

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @hostname = @attrs['hostname']
        @status = @attrs['status']
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
