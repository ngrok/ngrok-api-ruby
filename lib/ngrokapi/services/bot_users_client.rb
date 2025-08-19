# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-bot-users
    class BotUsersClient
      # The API path for the requests
      PATH = '/bot_users'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'bot_users'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new bot user
      #
      # @param [string] name human-readable name used to identify the bot
      # @param [boolean] active whether or not the bot is active
      # @return [NgrokAPI::Models::BotUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-bot-users-create
      def create(name: "", active: nil)
        path = '/bot_users'
        replacements = {
        }
        data = {}
        data[:name] = name if name
        data[:active] = active if active
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::BotUser.new(client: self, attrs: result)
      end

      ##
      # Create a new bot user
      # Throws an exception if API error.
      #
      # @param [string] name human-readable name used to identify the bot
      # @param [boolean] active whether or not the bot is active
      # @return [NgrokAPI::Models::BotUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-bot-users-create
      def create!(name: "", active: nil)
        path = '/bot_users'
        replacements = {
        }
        data = {}
        data[:name] = name if name
        data[:active] = active if active
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::BotUser.new(client: self, attrs: result)
      end

      ##
      # Delete a bot user by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-bot-users-delete
      def delete(id: "")
        path = '/bot_users/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a bot user by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-bot-users-delete
      def delete!(id: "")
        path = '/bot_users/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get the details of a Bot User by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::BotUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-bot-users-get
      def get(id: "")
        path = '/bot_users/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::BotUser.new(client: self, attrs: result)
      end

      ##
      # Get the details of a Bot User by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::BotUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-bot-users-get
      def get!(id: "")
        path = '/bot_users/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::BotUser.new(client: self, attrs: result)
      end

      ##
      # List all bot users in this account.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-bot-users-list
      def list(
        before_id: nil,
        limit: nil,
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::BotUser
        )
      end

      ##
      # List all bot users in this account.
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-bot-users-list
      def list!(
        before_id: nil,
        limit: nil,
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          danger: true,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::BotUser,
          danger: true
        )
      end

      ##
      # Update attributes of a bot user by ID.
      #
      # @param [string] id
      # @param [string] name human-readable name used to identify the bot
      # @param [boolean] active whether or not the bot is active
      # @return [NgrokAPI::Models::BotUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-bot-users-update
      def update(id: "", name: nil, active: nil)
        path = '/bot_users/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:name] = name if name
        data[:active] = active if active
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::BotUser.new(client: self, attrs: result)
      end

      ##
      # Update attributes of a bot user by ID.
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] name human-readable name used to identify the bot
      # @param [boolean] active whether or not the bot is active
      # @return [NgrokAPI::Models::BotUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-bot-users-update
      def update!(id: "", name: nil, active: nil)
        path = '/bot_users/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:name] = name if name
        data[:active] = active if active
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::BotUser.new(client: self, attrs: result)
      end
    end
  end
end
