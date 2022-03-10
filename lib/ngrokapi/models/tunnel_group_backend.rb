# frozen_string_literal: true

module NgrokAPI
  module Models
    class TunnelGroupBackend
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :labels,
        :tunnels

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @labels = @result['labels']
        @tunnels = @result['tunnels']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete a TunnelGroup backend by ID. TODO what if used?
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
