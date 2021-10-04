# frozen_string_literal: true

module NgrokAPI
  module Models
    class AbuseReport
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :urls,
        :metadata,
        :status,
        :hostnames

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @urls = @result['urls']
        @metadata = @result['metadata']
        @status = @result['status']
        @hostnames = @result['hostnames']
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
