# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'uri'

module NgrokAPI
  module Models
    class Vault
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :updated_at,
        :name,
        :description,
        :metadata,
        :created_by,
        :last_updated_by

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @created_at = @attrs['created_at']
        @updated_at = @attrs['updated_at']
        @name = @attrs['name']
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @created_by = @attrs['created_by']
        @last_updated_by = @attrs['last_updated_by']
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
      # Update an existing Vault by ID
      #
      # https://ngrok.com/docs/api#api-vaults-update
      def update(
        name: nil,
        metadata: nil,
        description: nil
      )
        @name = name if name
        @metadata = metadata if metadata
        @description = description if description
        @client.update(
          id: @id,
          name: name,
          metadata: metadata,
          description: description
        )
      end

      ##
      # Delete a Vault
      #
      # https://ngrok.com/docs/api#api-vaults-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
