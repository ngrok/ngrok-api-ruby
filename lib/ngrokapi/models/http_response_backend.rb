# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class HTTPResponseBackend
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :body,
        :headers,
        :status_code

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
        @body = @attrs['body']
        @headers = @attrs['headers']
        @status_code = @attrs['status_code']
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
