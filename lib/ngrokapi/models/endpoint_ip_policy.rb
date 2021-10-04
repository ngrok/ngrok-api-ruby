# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointIPPolicy
      attr_reader :client,
        :result,
        :enabled,
        :ip_policies

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @ip_policies = @result['ip_policies']
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
