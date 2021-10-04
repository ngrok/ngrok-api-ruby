# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointMutualTLS
      attr_reader :client,
        :result,
        :enabled,
        :certificate_authorities

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @certificate_authorities = @result['certificate_authorities']
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
