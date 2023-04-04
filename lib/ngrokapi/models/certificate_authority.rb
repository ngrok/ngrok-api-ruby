# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class CertificateAuthority
      attr_reader :client,
        :attrs,
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
        @ca_pem = @attrs['ca_pem']
        @subject_common_name = @attrs['subject_common_name']
        @not_before = @attrs['not_before']
        @not_after = @attrs['not_after']
        @key_usages = @attrs['key_usages']
        @extended_key_usages = @attrs['extended_key_usages']
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
