# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class KubernetesOperatorBinding
      attr_reader :client,
        :attrs,
        :endpoint_selectors,
        :cert,
        :ingress_endpoint

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @endpoint_selectors = @attrs['endpoint_selectors']
        @cert = @attrs['cert']
        @ingress_endpoint = @attrs['ingress_endpoint']
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
