# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # Secrets is an api service for securely storing and managing sensitive data such
    # as secrets, credentials, and tokens.
    #
    # https://ngrok.com/docs/api#api-secrets
    class SecretsClient
      # The API path for the requests
      PATH = '/vault_secrets'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'secrets'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new Secret
      #
      # @param [string] name Name of secret
      # @param [string] value Value of secret
      # @param [string] metadata Arbitrary user-defined metadata for this Secret
      # @param [string] description description of Secret
      # @param [string] vault_id unique identifier of the referenced vault
      # @return [NgrokAPI::Models::Secret] result from the API request
      #
      # https://ngrok.com/docs/api#api-secrets-create
      def create(name: "", value: "", metadata: "", description: "", vault_id:)
        path = '/vault_secrets'
        replacements = {
        }
        data = {}
        data[:name] = name if name
        data[:value] = value if value
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:vault_id] = vault_id if vault_id
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::Secret.new(client: self, attrs: result)
      end

      ##
      # Create a new Secret
      # Throws an exception if API error.
      #
      # @param [string] name Name of secret
      # @param [string] value Value of secret
      # @param [string] metadata Arbitrary user-defined metadata for this Secret
      # @param [string] description description of Secret
      # @param [string] vault_id unique identifier of the referenced vault
      # @return [NgrokAPI::Models::Secret] result from the API request
      #
      # https://ngrok.com/docs/api#api-secrets-create
      def create!(name: "", value: "", metadata: "", description: "", vault_id:)
        path = '/vault_secrets'
        replacements = {
        }
        data = {}
        data[:name] = name if name
        data[:value] = value if value
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:vault_id] = vault_id if vault_id
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Secret.new(client: self, attrs: result)
      end

      ##
      # Update an existing Secret by ID
      #
      # @param [string] id identifier for Secret
      # @param [string] name Name of secret
      # @param [string] value Value of secret
      # @param [string] metadata Arbitrary user-defined metadata for this Secret
      # @param [string] description description of Secret
      # @return [NgrokAPI::Models::Secret] result from the API request
      #
      # https://ngrok.com/docs/api#api-secrets-update
      def update(id: "", name: nil, value: nil, metadata: nil, description: nil)
        path = '/vault_secrets/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:name] = name if name
        data[:value] = value if value
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::Secret.new(client: self, attrs: result)
      end

      ##
      # Update an existing Secret by ID
      # Throws an exception if API error.
      #
      # @param [string] id identifier for Secret
      # @param [string] name Name of secret
      # @param [string] value Value of secret
      # @param [string] metadata Arbitrary user-defined metadata for this Secret
      # @param [string] description description of Secret
      # @return [NgrokAPI::Models::Secret] result from the API request
      #
      # https://ngrok.com/docs/api#api-secrets-update
      def update!(id: "", name: nil, value: nil, metadata: nil, description: nil)
        path = '/vault_secrets/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:name] = name if name
        data[:value] = value if value
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Secret.new(client: self, attrs: result)
      end

      ##
      # Delete a Secret
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-secrets-delete
      def delete(id: "")
        path = '/vault_secrets/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a Secret
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-secrets-delete
      def delete!(id: "")
        path = '/vault_secrets/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get a Secret by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Secret] result from the API request
      #
      # https://ngrok.com/docs/api#api-secrets-get
      def get(id: "")
        path = '/vault_secrets/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::Secret.new(client: self, attrs: result)
      end

      ##
      # Get a Secret by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Secret] result from the API request
      #
      # https://ngrok.com/docs/api#api-secrets-get
      def get!(id: "")
        path = '/vault_secrets/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Secret.new(client: self, attrs: result)
      end

      ##
      # List all Secrets owned by account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-secrets-list
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
          klass: NgrokAPI::Models::Secret
        )
      end

      ##
      # List all Secrets owned by account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-secrets-list
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
          klass: NgrokAPI::Models::Secret,
          danger: true
        )
      end
    end
  end
end
