# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'uri'

module NgrokAPI
  module Models
    class Secret
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
        :last_updated_by,
        :vault,
        :vault_name

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
        @vault = @attrs['vault']
        @vault_name = @attrs['vault_name']
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
      # Delete a Secret
      #
      # https://ngrok.com/docs/api#api-secrets-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
