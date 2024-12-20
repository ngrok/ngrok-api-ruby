# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

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
        :scheme,
        :hostport,
        :host,
        :port,
        :type,
        :metadata,
        :description,
        :domain,
        :tcp_addr,
        :tunnel,
        :edge,
        :upstream_url,
        :upstream_proto,
        :url,
        :principal,
        :principal_id,
        :traffic_policy,
        :bindings,
        :tunnel_session,
        :uri,
        :name

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
        @scheme = @attrs['scheme']
        @hostport = @attrs['hostport']
        @host = @attrs['host']
        @port = @attrs['port']
        @type = @attrs['type']
        @metadata = @attrs['metadata']
        @description = @attrs['description']
        @domain = @attrs['domain']
        @tcp_addr = @attrs['tcp_addr']
        @tunnel = @attrs['tunnel']
        @edge = @attrs['edge']
        @upstream_url = @attrs['upstream_url']
        @upstream_proto = @attrs['upstream_proto']
        @url = @attrs['url']
        @principal = @attrs['principal']
        @principal_id = @attrs['principal_id']
        @traffic_policy = @attrs['traffic_policy']
        @bindings = @attrs['bindings']
        @tunnel_session = @attrs['tunnel_session']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @name = @attrs['name']
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

      ##
      # Update an Endpoint by ID, currently available only for cloud endpoints
      #
      # https://ngrok.com/docs/api#api-endpoints-update
      def update(
        url: nil,
        traffic_policy: nil,
        description: nil,
        metadata: nil,
        bindings: nil
      )
        @url = url if url
        @traffic_policy = traffic_policy if traffic_policy
        @description = description if description
        @metadata = metadata if metadata
        @bindings = bindings if bindings
        @client.update(
          id: @id,
          url: url,
          traffic_policy: traffic_policy,
          description: description,
          metadata: metadata,
          bindings: bindings
        )
      end

      ##
      # Delete an Endpoint by ID, currently available only for cloud endpoints
      #
      # https://ngrok.com/docs/api#api-endpoints-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
