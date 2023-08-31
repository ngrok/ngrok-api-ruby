# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class ReservedDomainCertStatus
      attr_reader :client,
        :attrs,
        :renews_at,
        :provisioning_job

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @renews_at = @attrs['renews_at']
        @provisioning_job = @attrs['provisioning_job']
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
