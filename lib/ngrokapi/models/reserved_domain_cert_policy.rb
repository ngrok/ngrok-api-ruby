# frozen_string_literal: true

module NgrokAPI
  module Models
    class ReservedDomainCertPolicy
      attr_reader :client,
        :result,
        :authority,
        :private_key_type

      def initialize(client:, result:)
        @client = client
        @result = result
        @authority = @result['authority']
        @private_key_type = @result['private_key_type']
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
