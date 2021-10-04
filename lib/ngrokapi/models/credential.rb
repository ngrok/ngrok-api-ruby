# frozen_string_literal: true

module NgrokAPI
  module Models
    class Credential
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :token,
        :acl

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @token = @result['token']
        @acl = @result['acl']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete a tunnel authtoken credential by ID
      #
      # https://ngrok.com/docs/api#api-credentials-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of an tunnel authtoken credential by ID
      #
      # https://ngrok.com/docs/api#api-credentials-update
      def update(
        description: nil,
        metadata: nil,
        acl: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @acl = acl if acl
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          acl: acl
        )
      end
    end
  end
end
