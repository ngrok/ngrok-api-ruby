# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class SSHCredential
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :public_key,
        :acl,
        :owner_id

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
        @acl = @attrs['acl']
        @owner_id = @attrs['owner_id']
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
