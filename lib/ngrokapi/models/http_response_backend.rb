# frozen_string_literal: true

module NgrokAPI
  module Models
    class HTTPResponseBackend
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :body,
        :headers,
        :status_code

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @body = @result['body']
        @headers = @result['headers']
        @status_code = @result['status_code']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # https://ngrok.com/docs/api#api-http-response-backends-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # https://ngrok.com/docs/api#api-http-response-backends-update
      def update(
        description: nil,
        metadata: nil,
        body: nil,
        headers: nil,
        status_code: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @body = body if body
        @headers = headers if headers
        @status_code = status_code if status_code
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          body: body,
          headers: headers,
          status_code: status_code
        )
      end
    end
  end
end
