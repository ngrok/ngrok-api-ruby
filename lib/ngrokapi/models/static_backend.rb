# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'uri'

module NgrokAPI
  module Models
    class StaticBackend
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :address,
        :tls

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
        @address = @attrs['address']
        @tls = @attrs['tls']
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
      # Delete a static backend by ID.
      #
      # https://ngrok.com/docs/api#api-static-backends-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update static backend by ID
      #
      # https://ngrok.com/docs/api#api-static-backends-update
      def update(
        description: nil,
        metadata: nil,
        address: "",
        tls: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @address = address if address
        @tls = tls if tls
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          address: address,
          tls: tls
        )
      end
    end
  end
end
