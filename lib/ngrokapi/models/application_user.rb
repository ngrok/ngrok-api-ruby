# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class ApplicationUser
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :identity_provider,
        :provider_user_id,
        :username,
        :email,
        :name,
        :created_at,
        :last_active,
        :last_login

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @identity_provider = @attrs['identity_provider']
        @provider_user_id = @attrs['provider_user_id']
        @username = @attrs['username']
        @email = @attrs['email']
        @name = @attrs['name']
        @created_at = @attrs['created_at']
        @last_active = @attrs['last_active']
        @last_login = @attrs['last_login']
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
      # Delete an application user by ID.
      #
      # https://ngrok.com/docs/api#api-application-users-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
