# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class ApplicationSession
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :public_url,
        :browser_session,
        :application_user,
        :created_at,
        :last_active,
        :expires_at,
        :endpoint,
        :edge,
        :route

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        unless @attrs['public_url'].nil?
          @public_url = URI(@attrs['public_url'])
        end
        @browser_session = @attrs['browser_session']
        @application_user = @attrs['application_user']
        @created_at = @attrs['created_at']
        @last_active = @attrs['last_active']
        @expires_at = @attrs['expires_at']
        @endpoint = @attrs['endpoint']
        @edge = @attrs['edge']
        @route = @attrs['route']
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
      # Delete an application session by ID.
      #
      # https://ngrok.com/docs/api#api-application-sessions-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
