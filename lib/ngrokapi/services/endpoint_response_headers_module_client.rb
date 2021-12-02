# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-endpoint-response-headers-module
    class EndpointResponseHeadersModuleClient
      # The API path for the requests
      PATH = '/endpoint_configurations/%{id}/response_headers'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointResponseHeaders] a_module
      # @return [NgrokAPI::Models::EndpointResponseHeaders] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-response-headers-module-replace
      def replace(id: "", a_module: nil)
        path = '/endpoint_configurations/%{id}/response_headers'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointResponseHeaders.new(client: self, result: result)
      end

      ##
      # @param [string] id
      # @param [EndpointResponseHeaders] a_module
      # @return [NgrokAPI::Models::EndpointResponseHeaders] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-response-headers-module-replace
      def replace!(id: "", a_module: nil)
        path = '/endpoint_configurations/%{id}/response_headers'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointResponseHeaders.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointResponseHeaders] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-response-headers-module-get
      def get(id: "")
        path = '/endpoint_configurations/%{id}/response_headers'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointResponseHeaders.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointResponseHeaders] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-response-headers-module-get
      def get!(id: "")
        path = '/endpoint_configurations/%{id}/response_headers'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointResponseHeaders.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-response-headers-module-delete
      def delete(id: "")
        path = '/endpoint_configurations/%{id}/response_headers'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-response-headers-module-delete
      def delete!(id: "")
        path = '/endpoint_configurations/%{id}/response_headers'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
