# frozen_string_literal: true

module NgrokAPI
  module Models
    class TlsCertificate
      attr_reader :id,
        :client,
        :created_at,
        :description,
        :metadata,
        :result,
        :uri

      def initialize(client:, result:)
        @client = client
        @result = result
        @created_at = @result['created_at']
        @id = @result['id']
        @description = @result['description']
        @metadata = @result['metadata']
        @uri = @result['uri']
      end

      # TODO: equality
      def ==(other)
      end

      # TODO: to_s
      def to_s
      end

      def delete
        @client.delete(id: @id)
      end

      def update(description: nil, metadata: nil)
        @description = description if description
        @metadata = metadata if metadata
        @client.update(id: @id, description: description, metadata: metadata)
      end
    end
  end
end
