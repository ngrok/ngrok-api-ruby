# frozen_string_literal: true

module NgrokAPI
  module Models
    class Tunnel
      attr_reader :client,
        :result,
        :id,
        :public_url,
        :started_at,
        :metadata,
        :proto,
        :region,
        :tunnel_session

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @public_url = @result['public_url']
        @started_at = @result['started_at']
        @metadata = @result['metadata']
        @proto = @result['proto']
        @region = @result['region']
        @tunnel_session = @result['tunnel_session']
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
