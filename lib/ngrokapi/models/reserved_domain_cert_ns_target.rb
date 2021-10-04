# frozen_string_literal: true

module NgrokAPI
  module Models
    class ReservedDomainCertNSTarget
      attr_reader :client,
        :result,
        :zone,
        :nameservers

      def initialize(client:, result:)
        @client = client
        @result = result
        @zone = @result['zone']
        @nameservers = @result['nameservers']
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
