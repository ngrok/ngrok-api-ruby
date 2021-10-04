# frozen_string_literal: true

module NgrokAPI
  module Models
    class AbuseReportHostname
      attr_reader :client,
        :result,
        :hostname,
        :status

      def initialize(client:, result:)
        @client = client
        @result = result
        @hostname = @result['hostname']
        @status = @result['status']
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
