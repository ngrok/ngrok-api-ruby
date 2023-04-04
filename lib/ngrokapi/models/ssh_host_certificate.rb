# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class SSHHostCertificate
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :public_key,
        :key_type,
        :ssh_certificate_authority_id,
        :principals,
        :valid_after,
        :valid_until,
        :certificate

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
        @public_key = @attrs['public_key']
        @key_type = @attrs['key_type']
        @ssh_certificate_authority_id = @attrs['ssh_certificate_authority_id']
        @principals = @attrs['principals']
        @valid_after = @attrs['valid_after']
        @valid_until = @attrs['valid_until']
        @certificate = @attrs['certificate']
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
      # Delete an SSH Host Certificate
      #
      # https://ngrok.com/docs/api#api-ssh-host-certificates-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update an SSH Host Certificate
      #
      # https://ngrok.com/docs/api#api-ssh-host-certificates-update
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
