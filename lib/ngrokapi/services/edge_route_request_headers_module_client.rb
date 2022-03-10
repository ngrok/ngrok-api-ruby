# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-edge-route-request-headers-module
    class EdgeRouteRequestHeadersModuleClient
      # The API path for the requests
      PATH = '/edges/https/%{edge_id}/routes/%{id}/request_headers'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] edge_id
      # @param [string] id
      # @param [EndpointRequestHeaders] a_module
      # @return [NgrokAPI::Models::EndpointRequestHeaders] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-request-headers-module-replace
      def replace(edge_id: "", id: "", a_module: nil)
        path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointRequestHeaders.new(client: self, result: result)
      end

      ##
      # @param [string] edge_id
      # @param [string] id
      # @param [EndpointRequestHeaders] a_module
      # @return [NgrokAPI::Models::EndpointRequestHeaders] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-request-headers-module-replace
      def replace!(edge_id: "", id: "", a_module: nil)
        path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointRequestHeaders.new(client: self, result: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::EndpointRequestHeaders] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-request-headers-module-get
      def get(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointRequestHeaders.new(client: self, result: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::EndpointRequestHeaders] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-request-headers-module-get
      def get!(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointRequestHeaders.new(client: self, result: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-request-headers-module-delete
      def delete(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-request-headers-module-delete
      def delete!(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
