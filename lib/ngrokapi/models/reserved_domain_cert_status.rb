# frozen_string_literal: true

module NgrokAPI
  module Models
    class ReservedDomainCertStatus
      attr_reader :client,
        :result,
        :renews_at,
        :provisioning_job

      def initialize(client:, result:)
        @client = client
        @result = result
        @renews_at = @result['renews_at']
        @provisioning_job = @result['provisioning_job']
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
