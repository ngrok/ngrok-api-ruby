# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class WeightedBackend
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :backends

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
        @backends = @attrs['backends']
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
      # Delete a Weighted backend by ID.
      #
      # https://ngrok.com/docs/api#api-weighted-backends-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update Weighted backend by ID
      #
      # https://ngrok.com/docs/api#api-weighted-backends-update
      def update(
        description: nil,
        metadata: nil,
        backends: {}
      )
        @description = description if description
        @metadata = metadata if metadata
        @backends = backends if backends
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          backends: backends
        )
      end
    end
  end
end
