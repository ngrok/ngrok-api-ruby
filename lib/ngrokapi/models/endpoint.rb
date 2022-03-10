# frozen_string_literal: true

module NgrokAPI
  module Models
    class Endpoint
      attr_reader :client,
        :result,
        :id,
        :region,
        :created_at,
        :updated_at,
        :public_url,
        :proto,
        :hostport,
        :type,
        :metadata,
        :domain,
        :tcp_addr,
        :tunnel,
        :edge

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @region = @result['region']
        @created_at = @result['created_at']
        @updated_at = @result['updated_at']
        @public_url = @result['public_url']
        @proto = @result['proto']
        @hostport = @result['hostport']
        @type = @result['type']
        @metadata = @result['metadata']
        @domain = @result['domain']
        @tcp_addr = @result['tcp_addr']
        @tunnel = @result['tunnel']
        @edge = @result['edge']
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
