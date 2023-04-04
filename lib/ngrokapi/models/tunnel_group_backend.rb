# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class TunnelGroupBackend
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :labels,
        :tunnels

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
        @labels = @attrs['labels']
        @tunnels = @attrs['tunnels']
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
      # Delete a TunnelGroup backend by ID.
      #
      # https://ngrok.com/docs/api#api-tunnel-group-backends-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update TunnelGroup backend by ID
      #
      # https://ngrok.com/docs/api#api-tunnel-group-backends-update
      def update(
        description: nil,
        metadata: nil,
        labels: {}
      )
        @description = description if description
        @metadata = metadata if metadata
        @labels = labels if labels
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          labels: labels
        )
      end
    end
  end
end
