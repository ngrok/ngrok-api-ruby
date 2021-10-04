# frozen_string_literal: true

module NgrokAPI
  module Models
    class TunnelSession
      attr_reader :client,
        :result,
        :agent_version,
        :credential,
        :id,
        :ip,
        :metadata,
        :os,
        :region,
        :started_at,
        :transport,
        :uri

      def initialize(client:, result:)
        @client = client
        @result = result
        @agent_version = @result['agent_version']
        @credential = @result['credential']
        @id = @result['id']
        @ip = @result['ip']
        @metadata = @result['metadata']
        @os = @result['os']
        @region = @result['region']
        @started_at = @result['started_at']
        @transport = @result['transport']
        @uri = @result['uri']
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
