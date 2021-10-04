# frozen_string_literal: true

module NgrokAPI
  module Models
    class APIKey
      attr_reader :client,
        :result,
        :id,
        :uri,
        :description,
        :metadata,
        :created_at,
        :token

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @description = @result['description']
        @metadata = @result['metadata']
        @created_at = @result['created_at']
        @token = @result['token']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete an API key by ID
      #
      # https://ngrok.com/docs/api#api-api-keys-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of an API key by ID.
      #
      # https://ngrok.com/docs/api#api-api-keys-update
      def update(
        description: nil,
        metadata: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @client.update(
          id: @id,
          description: description,
          metadata: metadata
        )
      end
    end
  end
end
