# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointIPPolicyMutate
      attr_reader :client,
        :result,
        :enabled,
        :ip_policy_ids

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @ip_policy_ids = @result['ip_policy_ids']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end
    end
  end
end
