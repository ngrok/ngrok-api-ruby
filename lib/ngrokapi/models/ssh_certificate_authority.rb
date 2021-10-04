# frozen_string_literal: true

module NgrokAPI
  module Models
    class SSHCertificateAuthority
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :public_key,
        :key_type

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @public_key = @result['public_key']
        @key_type = @result['key_type']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete an SSH Certificate Authority
      #
      # https://ngrok.com/docs/api#api-ssh-certificate-authorities-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update an SSH Certificate Authority
      #
      # https://ngrok.com/docs/api#api-ssh-certificate-authorities-update
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
