# frozen_string_literal: true

module NgrokAPI
  module Models
    class WeightedBackend
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :backends

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @backends = @result['backends']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete a Weighted backend by ID. TODO what if used?
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
