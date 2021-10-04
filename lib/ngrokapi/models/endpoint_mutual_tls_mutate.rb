# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointMutualTLSMutate
      attr_reader :client,
        :result,
        :enabled,
        :certificate_authority_ids

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @certificate_authority_ids = @result['certificate_authority_ids']
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
