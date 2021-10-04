# frozen_string_literal: true

module NgrokAPI
  module Models
    class CertificateAuthority
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :ca_pem,
        :subject_common_name,
        :not_before,
        :not_after,
        :key_usages,
        :extended_key_usages

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @ca_pem = @result['ca_pem']
        @subject_common_name = @result['subject_common_name']
        @not_before = @result['not_before']
        @not_after = @result['not_after']
        @key_usages = @result['key_usages']
        @extended_key_usages = @result['extended_key_usages']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete a Certificate Authority
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of a Certificate Authority by ID
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-update
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
