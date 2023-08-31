# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # API Keys are used to authenticate to the [ngrok
    #  API](https://ngrok.com/docs/api#authentication). You may use the API itself
    #  to provision and manage API Keys but you'll need to provision your first API
    #  key from the [API Keys page](https://dashboard.ngrok.com/api/keys) on your
    #  ngrok.com dashboard.
    #
    # https://ngrok.com/docs/api#api-api-keys
    class APIKeysClient
      # The API path for the requests
      PATH = '/api_keys'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'keys'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new API key. The generated API key can be used to authenticate to the
      # ngrok API.
      #
      # @param [string] description human-readable description of what uses the API key to authenticate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined data of this API key. optional, max 4096 bytes
      # @param [string] owner_id If supplied at credential creation, ownership will be assigned to the specified User or Bot. Only admins may specify an owner other than themselves. Defaults to the authenticated User or Bot.
      # @return [NgrokAPI::Models::APIKey] result from the API request
      #
      # https://ngrok.com/docs/api#api-api-keys-create
      def create(description: "", metadata: "", owner_id: nil, owner_email: "")
        path = '/api_keys'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:owner_id] = owner_id if owner_id
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::APIKey.new(client: self, attrs: result)
      end

      ##
      # Create a new API key. The generated API key can be used to authenticate to the
      # ngrok API.
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of what uses the API key to authenticate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined data of this API key. optional, max 4096 bytes
      # @param [string] owner_id If supplied at credential creation, ownership will be assigned to the specified User or Bot. Only admins may specify an owner other than themselves. Defaults to the authenticated User or Bot.
      # @return [NgrokAPI::Models::APIKey] result from the API request
      #
      # https://ngrok.com/docs/api#api-api-keys-create
      def create!(description: "", metadata: "", owner_id: nil, owner_email: "")
        path = '/api_keys'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:owner_id] = owner_id if owner_id
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::APIKey.new(client: self, attrs: result)
      end

      ##
      # Delete an API key by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-api-keys-delete
      def delete(id: "")
        path = '/api_keys/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an API key by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-api-keys-delete
      def delete!(id: "")
        path = '/api_keys/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get the details of an API key by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::APIKey] result from the API request
      #
      # https://ngrok.com/docs/api#api-api-keys-get
      def get(id: "")
        path = '/api_keys/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::APIKey.new(client: self, attrs: result)
      end

      ##
      # Get the details of an API key by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::APIKey] result from the API request
      #
      # https://ngrok.com/docs/api#api-api-keys-get
      def get!(id: "")
        path = '/api_keys/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::APIKey.new(client: self, attrs: result)
      end

      ##
      # List all API keys owned by this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-api-keys-list
      def list(before_id: nil, limit: nil, url: nil)
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
          klass: NgrokAPI::Models::APIKey
        )
      end

      ##
      # List all API keys owned by this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-api-keys-list
      def list!(before_id: nil, limit: nil, url: nil)
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
          klass: NgrokAPI::Models::APIKey,
          danger: true
        )
      end

      ##
      # Update attributes of an API key by ID.
      #
      # @param [string] id
      # @param [string] description human-readable description of what uses the API key to authenticate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined data of this API key. optional, max 4096 bytes
      # @return [NgrokAPI::Models::APIKey] result from the API request
      #
      # https://ngrok.com/docs/api#api-api-keys-update
      def update(id: "", description: nil, metadata: nil)
        path = '/api_keys/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::APIKey.new(client: self, attrs: result)
      end

      ##
      # Update attributes of an API key by ID.
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of what uses the API key to authenticate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined data of this API key. optional, max 4096 bytes
      # @return [NgrokAPI::Models::APIKey] result from the API request
      #
      # https://ngrok.com/docs/api#api-api-keys-update
      def update!(id: "", description: nil, metadata: nil)
        path = '/api_keys/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::APIKey.new(client: self, attrs: result)
      end
    end
  end
end
