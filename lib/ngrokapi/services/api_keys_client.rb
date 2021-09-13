# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # A client for interacting with the api_keys API
    #
    # https://ngrok.com/docs/api#api-api-keys
    class ApiKeysClient
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'keys'
      # The API path for API keys
      PATH = '/api_keys'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new API key. The generated API key can be used to authenticate to the ngrok API.
      #
      # rubocop:disable LineLength
      # @param [string] description human-readable description of what uses the API key to authenticate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined data of this API key. optional, max 4096 bytes
      # @return [NgrokAPI::Models::ApiKey] result from create request
      # rubocop:enable LineLength
      #
      # https://ngrok.com/docs/api#api-api-keys-create
      def create(description: nil, metadata: nil)
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.post(PATH, data: data)
        NgrokAPI::Models::ApiKey.new(client: self, result: result)
      end

      ##
      # Delete an API key by ID.
      #
      # @param [string] id a resource identifier
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-api-keys-delete
      def delete(id: nil)
        @client.delete("#{PATH}/#{id}")
      end

      ##
      # Get the details of an API key by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ApiKey] result from get request
      #
      # https://ngrok.com/docs/api#api-api-keys-get
      def get(id: nil)
        result = @client.get("#{PATH}/#{id}")
        NgrokAPI::Models::ApiKey.new(client: self, result: result)
      end

      ##
      # List all API keys owned by this account.
      #
      # @param [string] before_id
      # @param [integer] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] the result listable
      #
      # https://ngrok.com/docs/api#api-api-keys-list
      def list(before_id: nil, limit: nil, url: nil)
        result = @client.list(before_id: before_id, limit: limit, url: url, path: PATH)
        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::ApiKey
        )
      end

      ##
      # Update attributes of an API key by ID.
      #
      # rubocop:disable LineLength
      # @param [string] id
      # @param [string] description human-readable description of what uses the API key to authenticate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined data of this API key. optional, max 4096 bytes
      # @return [NgrokAPI::Models::ApiKey] result from update request
      # rubocop:enable LineLength
      #
      # https://ngrok.com/docs/api#api-api-keys-update
      def update(id: nil, description: nil, metadata: nil)
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch("#{PATH}/#{id}", data: data)
        NgrokAPI::Models::ApiKey.new(client: self, result: result)
      end
    end
  end
end
