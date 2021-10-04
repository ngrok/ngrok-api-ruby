# frozen_string_literal: true

module NgrokAPI
  module Models
    class TLSCertificate
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :certificate_pem,
        :subject_common_name,
        :subject_alternative_names,
        :issued_at,
        :not_before,
        :not_after,
        :key_usages,
        :extended_key_usages,
        :private_key_type,
        :issuer_common_name,
        :serial_number,
        :subject_organization,
        :subject_organizational_unit,
        :subject_locality,
        :subject_province,
        :subject_country

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @certificate_pem = @result['certificate_pem']
        @subject_common_name = @result['subject_common_name']
        @subject_alternative_names = @result['subject_alternative_names']
        @issued_at = @result['issued_at']
        @not_before = @result['not_before']
        @not_after = @result['not_after']
        @key_usages = @result['key_usages']
        @extended_key_usages = @result['extended_key_usages']
        @private_key_type = @result['private_key_type']
        @issuer_common_name = @result['issuer_common_name']
        @serial_number = @result['serial_number']
        @subject_organization = @result['subject_organization']
        @subject_organizational_unit = @result['subject_organizational_unit']
        @subject_locality = @result['subject_locality']
        @subject_province = @result['subject_province']
        @subject_country = @result['subject_country']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete a TLS certificate
      #
      # https://ngrok.com/docs/api#api-tls-certificates-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of a TLS Certificate by ID
      #
      # https://ngrok.com/docs/api#api-tls-certificates-update
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
