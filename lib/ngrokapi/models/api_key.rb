# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class APIKey
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :description,
        :metadata,
        :created_at,
        :token,
        :owner_id

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @created_at = @attrs['created_at']
        @token = @attrs['token']
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
      # Delete an API key by ID
      #
      # https://ngrok.com/docs/api#api-api-keys-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of an API key by ID.
      #
      # https://ngrok.com/docs/api#api-api-keys-update
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
