# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class KubernetesOperatorBindingUpdate
      attr_reader :client,
        :attrs,
        :name,
        :allowed_urls,
        :csr,
        :ingress_endpoint

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @name = @attrs['name']
        @allowed_urls = @attrs['allowed_urls']
        @csr = @attrs['csr']
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
