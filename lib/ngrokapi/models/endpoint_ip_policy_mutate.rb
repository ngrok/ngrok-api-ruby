# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointIPPolicyMutate
      attr_reader :client,
        :attrs,
        :enabled,
        :ip_policy_ids

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @ip_policy_ids = @attrs['ip_policy_ids']
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
