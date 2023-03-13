# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class Endpoint
      attr_reader :client,
        :attrs,
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

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        @region = @attrs['region']
        @created_at = @attrs['created_at']
        @updated_at = @attrs['updated_at']
        unless @attrs['public_url'].nil?
          @public_url = URI(@attrs['public_url'])
        end
        @proto = @attrs['proto']
        @hostport = @attrs['hostport']
        @type = @attrs['type']
        @metadata = @attrs['metadata']
        @domain = @attrs['domain']
        @tcp_addr = @attrs['tcp_addr']
        @tunnel = @attrs['tunnel']
        @edge = @attrs['edge']
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
