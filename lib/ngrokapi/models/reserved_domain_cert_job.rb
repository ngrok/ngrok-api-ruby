# frozen_string_literal: true

module NgrokAPI
  module Models
    class ReservedDomainCertJob
      attr_reader :client,
        :result,
        :error_code,
        :msg,
        :started_at,
        :retries_at,
        :ns_targets

      def initialize(client:, result:)
        @client = client
        @result = result
        @error_code = @result['error_code']
        @msg = @result['msg']
        @started_at = @result['started_at']
        @retries_at = @result['retries_at']
        @ns_targets = @result['ns_targets']
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
