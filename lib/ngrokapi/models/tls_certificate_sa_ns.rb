# frozen_string_literal: true

module NgrokAPI
  module Models
    class TLSCertificateSANs
      attr_reader :client,
        :result,
        :dns_names,
        :ips

      def initialize(client:, result:)
        @client = client
        @result = result
        @dns_names = @result['dns_names']
        @ips = @result['ips']
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
