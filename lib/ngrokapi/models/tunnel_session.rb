# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'uri'

module NgrokAPI
  module Models
    class TunnelSession
      attr_reader :client,
        :attrs,
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

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @agent_version = @attrs['agent_version']
        @credential = @attrs['credential']
        @id = @attrs['id']
        @ip = @attrs['ip']
        @metadata = @attrs['metadata']
        @os = @attrs['os']
        @region = @attrs['region']
        @started_at = @attrs['started_at']
        @transport = @attrs['transport']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
      end

      def ==(other)
        @attrs == other.attrs
      end

      def to_s
        @attrs.to_s
      end

      def to_h
        @attrs.to_h
      end
    end
  end
end
