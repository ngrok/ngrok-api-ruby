# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'uri'

module NgrokAPI
  module Models
    class TLSCertificate
      attr_reader :client,
        :attrs,
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

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @created_at = @attrs['created_at']
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @certificate_pem = @attrs['certificate_pem']
        @subject_common_name = @attrs['subject_common_name']
        @subject_alternative_names = @attrs['subject_alternative_names']
        @issued_at = @attrs['issued_at']
        @not_before = @attrs['not_before']
        @not_after = @attrs['not_after']
        @key_usages = @attrs['key_usages']
        @extended_key_usages = @attrs['extended_key_usages']
        @private_key_type = @attrs['private_key_type']
        @issuer_common_name = @attrs['issuer_common_name']
        @serial_number = @attrs['serial_number']
        @subject_organization = @attrs['subject_organization']
        @subject_organizational_unit = @attrs['subject_organizational_unit']
        @subject_locality = @attrs['subject_locality']
        @subject_province = @attrs['subject_province']
        @subject_country = @attrs['subject_country']
      end

      def ==(other)
        @attrs == other.attrs
      end

      def to_s
        @attrs.to_s
      end

      def to_h
        @attrs.to_h
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
