# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class KubernetesOperatorDeploymentUpdate
      attr_reader :client,
        :attrs,
        :name

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @name = @attrs['name']
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
