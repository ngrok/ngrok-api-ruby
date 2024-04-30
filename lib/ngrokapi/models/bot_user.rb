# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'uri'

module NgrokAPI
  module Models
    class BotUser
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :name,
        :active,
        :created_at

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @name = @attrs['name']
        @active = @attrs['active']
        @created_at = @attrs['created_at']
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
      # Delete a bot user by ID
      #
      # https://ngrok.com/docs/api#api-bot-users-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of a bot user by ID.
      #
      # https://ngrok.com/docs/api#api-bot-users-update
      def update(
        name: nil,
        active: nil
      )
        @name = name if name
        @active = active if active
        @client.update(
          id: @id,
          name: name,
          active: active
        )
      end
    end
  end
end
