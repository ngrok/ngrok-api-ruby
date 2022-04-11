# frozen_string_literal: true

module NgrokAPI
  module Models
    class Credential
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :token,
        :acl

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        @uri = @attrs['uri']
        @created_at = @attrs['created_at']
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @token = @attrs['token']
        @acl = @attrs['acl']
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
