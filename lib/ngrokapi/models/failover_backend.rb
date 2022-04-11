# frozen_string_literal: true

module NgrokAPI
  module Models
    class FailoverBackend
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
        @uri = @attrs['uri']
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
      # Delete a Failover backend by ID.
      #
      # https://ngrok.com/docs/api#api-failover-backends-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update Failover backend by ID
      #
      # https://ngrok.com/docs/api#api-failover-backends-update
      def update(
        description: nil,
        metadata: nil,
        backends: []
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
