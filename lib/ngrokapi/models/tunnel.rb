# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'uri'

module NgrokAPI
  module Models
    class Tunnel
      attr_reader :client,
        :attrs,
        :id,
        :public_url,
        :started_at,
        :metadata,
        :proto,
        :region,
        :tunnel_session,
        :endpoint,
        :labels,
        :backends,
        :forwards_to

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['public_url'].nil?
          @public_url = URI(@attrs['public_url'])
        end
        @started_at = @attrs['started_at']
        @metadata = @attrs['metadata']
        @proto = @attrs['proto']
        @region = @attrs['region']
        @tunnel_session = @attrs['tunnel_session']
        @endpoint = @attrs['endpoint']
        @labels = @attrs['labels']
        @backends = @attrs['backends']
        @forwards_to = @attrs['forwards_to']
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
