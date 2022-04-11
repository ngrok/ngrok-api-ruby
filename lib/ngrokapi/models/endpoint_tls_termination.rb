# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointTLSTermination
      attr_reader :client,
        :attrs,
        :enabled,
        :terminate_at,
        :min_version

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @terminate_at = @attrs['terminate_at']
        @min_version = @attrs['min_version']
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
