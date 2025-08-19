# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # Vaults is an api service for securely storing and managing sensitive data such
    # as secrets, credentials, and tokens.
    #
    # https://ngrok.com/docs/api#api-vaults
    class VaultsClient
      # The API path for the requests
      PATH = '/vaults'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'vaults'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new Vault
      #
      # @param [string] name Name of vault
      # @param [string] metadata Arbitrary user-defined metadata for this Vault
      # @param [string] description description of Vault
      # @return [NgrokAPI::Models::Vault] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-create
      def create(name: "", metadata: "", description: "")
        path = '/vaults'
        replacements = {
        }
        data = {}
        data[:name] = name if name
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::Vault.new(client: self, attrs: result)
      end

      ##
      # Create a new Vault
      # Throws an exception if API error.
      #
      # @param [string] name Name of vault
      # @param [string] metadata Arbitrary user-defined metadata for this Vault
      # @param [string] description description of Vault
      # @return [NgrokAPI::Models::Vault] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-create
      def create!(name: "", metadata: "", description: "")
        path = '/vaults'
        replacements = {
        }
        data = {}
        data[:name] = name if name
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Vault.new(client: self, attrs: result)
      end

      ##
      # Update an existing Vault by ID
      #
      # @param [string] id identifier for Vault
      # @param [string] name Name of vault
      # @param [string] metadata Arbitrary user-defined metadata for this Vault
      # @param [string] description description of Vault
      # @return [NgrokAPI::Models::Vault] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-update
      def update(id: "", name: nil, metadata: nil, description: nil)
        path = '/vaults/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:name] = name if name
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::Vault.new(client: self, attrs: result)
      end

      ##
      # Update an existing Vault by ID
      # Throws an exception if API error.
      #
      # @param [string] id identifier for Vault
      # @param [string] name Name of vault
      # @param [string] metadata Arbitrary user-defined metadata for this Vault
      # @param [string] description description of Vault
      # @return [NgrokAPI::Models::Vault] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-update
      def update!(id: "", name: nil, metadata: nil, description: nil)
        path = '/vaults/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:name] = name if name
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Vault.new(client: self, attrs: result)
      end

      ##
      # Delete a Vault
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-delete
      def delete(id: "")
        path = '/vaults/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a Vault
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-delete
      def delete!(id: "")
        path = '/vaults/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get a Vault by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Vault] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-get
      def get(id: "")
        path = '/vaults/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::Vault.new(client: self, attrs: result)
      end

      ##
      # Get a Vault by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Vault] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-get
      def get!(id: "")
        path = '/vaults/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Vault.new(client: self, attrs: result)
      end

      ##
      # Get Secrets by Vault ID
      #
      # @param [string] id a resource identifier
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-get-secrets-by-vault
      def get_secrets_by_vault(
        id: "",
        before_id: nil,
        limit: nil,
        url: nil
      )
        path = '/vaults/%{id}/secrets'
        replacements = {
          id: id,
        }
        result = @client.list(
          id: id,
          before_id: before_id,
          limit: limit,
          url: url,
          path: path % replacements
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: 'secrets',
          klass: NgrokAPI::Models::Secret
        )
      end

      ##
      # Get Secrets by Vault ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-get-secrets-by-vault
      def get_secrets_by_vault!(
        id: "",
        before_id: nil,
        limit: nil,
        url: nil
      )
        path = '/vaults/%{id}/secrets'
        replacements = {
          id: id,
        }
        result = @client.list(
          id: id,
          before_id: before_id,
          limit: limit,
          danger: true,
          url: url,
          path: path % replacements
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: 'secrets',
          klass: NgrokAPI::Models::Secret,
          danger: true
        )
      end

      ##
      # List all Vaults owned by account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-list
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
          klass: NgrokAPI::Models::Vault
        )
      end

      ##
      # List all Vaults owned by account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-vaults-list
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
          klass: NgrokAPI::Models::Vault,
          danger: true
        )
      end
    end
  end
end
