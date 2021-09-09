# frozen_string_literal: true

module NgrokAPI
  module Models
    class ApiKey
      attr_reader :client,
        :created_at,
        :description,
        :id,
        :metadata,
        :result,
        :token,
        :uri

      def initialize(client:, result:)
        @client = client
        @result = result
        @created_at = @result['created_at']
        @id = @result['id']
        @description = @result['description']
        @metadata = @result['metadata']
        @token = @result['token']
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

      def update(description: '', metadata: '')
        @description = description
        @metadata = metadata
        @client.update(id: @id, description: description, metadata: metadata)
      end
    end
  end
end
