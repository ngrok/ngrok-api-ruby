# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointIPPolicy
      attr_reader :client,
        :attrs,
        :enabled,
        :ip_policies

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @ip_policies = @attrs['ip_policies']
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
