# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class KubernetesOperatorCert
      attr_reader :client,
        :attrs,
        :cert,
        :not_before,
        :not_after

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @cert = @attrs['cert']
        @not_before = @attrs['not_before']
        @not_after = @attrs['not_after']
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
