# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-http-response-backends
    class HTTPResponseBackendsClient
      # The API path for the requests
      PATH = '/backends/http_response'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'backends'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [string] body body to return as fixed content
      # @param [Map<string, string>] headers headers to return
      # @param [int32] status_code status code to return
      # @return [NgrokAPI::Models::HTTPResponseBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-http-response-backends-create
      def create(description: "", metadata: "", body: "", headers: {}, status_code: nil)
        path = '/backends/http_response'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:body] = body if body
        data[:headers] = headers if headers
        data[:status_code] = status_code if status_code
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::HTTPResponseBackend.new(client: self, attrs: result)
      end

      ##
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [string] body body to return as fixed content
      # @param [Map<string, string>] headers headers to return
      # @param [int32] status_code status code to return
      # @return [NgrokAPI::Models::HTTPResponseBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-http-response-backends-create
      def create!(description: "", metadata: "", body: "", headers: {}, status_code: nil)
        path = '/backends/http_response'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:body] = body if body
        data[:headers] = headers if headers
        data[:status_code] = status_code if status_code
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::HTTPResponseBackend.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-http-response-backends-delete
      def delete(id: "")
        path = '/backends/http_response/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-http-response-backends-delete
      def delete!(id: "")
        path = '/backends/http_response/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::HTTPResponseBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-http-response-backends-get
      def get(id: "")
        path = '/backends/http_response/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::HTTPResponseBackend.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::HTTPResponseBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-http-response-backends-get
      def get!(id: "")
        path = '/backends/http_response/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::HTTPResponseBackend.new(client: self, attrs: result)
      end

      ##
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-http-response-backends-list
      def list(
        before_id: nil,
        limit: nil,
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::HTTPResponseBackend
        )
      end

      ##
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-http-response-backends-list
      def list!(
        before_id: nil,
        limit: nil,
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          danger: true,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::HTTPResponseBackend,
          danger: true
        )
      end

      ##
      # @param [string] id
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [string] body body to return as fixed content
      # @param [Map<string, string>] headers headers to return
      # @param [int32] status_code status code to return
      # @return [NgrokAPI::Models::HTTPResponseBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-http-response-backends-update
      def update(id: "", description: nil, metadata: nil, body: nil, headers: nil, status_code: nil)
        path = '/backends/http_response/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:body] = body if body
        data[:headers] = headers if headers
        data[:status_code] = status_code if status_code
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::HTTPResponseBackend.new(client: self, attrs: result)
      end

      ##
      # @param [string] id
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [string] body body to return as fixed content
      # @param [Map<string, string>] headers headers to return
      # @param [int32] status_code status code to return
      # @return [NgrokAPI::Models::HTTPResponseBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-http-response-backends-update
      def update!(id: "", description: nil, metadata: nil, body: nil, headers: nil, status_code: nil)
        path = '/backends/http_response/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:body] = body if body
        data[:headers] = headers if headers
        data[:status_code] = status_code if status_code
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::HTTPResponseBackend.new(client: self, attrs: result)
      end
    end
  end
end
