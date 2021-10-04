# frozen_string_literal: true

module NgrokAPI
  module Models
    class SSHCredential
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :public_key,
        :acl

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @public_key = @result['public_key']
        @acl = @result['acl']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete an ssh_credential by ID
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of an ssh_credential by ID
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-update
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
