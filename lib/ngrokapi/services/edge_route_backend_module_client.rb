# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-edge-route-backend-module
    class EdgeRouteBackendModuleClient
      # The API path for the requests
      PATH = '/edges/https/%{edge_id}/routes/%{id}/backend'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] edge_id
      # @param [string] id
      # @param [EndpointBackendMutate] a_module
      # @return [NgrokAPI::Models::EndpointBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-backend-module-replace
      def replace(edge_id: "", id: "", a_module: nil)
        path = '/edges/https/%{edge_id}/routes/%{id}/backend'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointBackend.new(client: self, result: result)
      end

      ##
      # @param [string] edge_id
      # @param [string] id
      # @param [EndpointBackendMutate] a_module
      # @return [NgrokAPI::Models::EndpointBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-backend-module-replace
      def replace!(edge_id: "", id: "", a_module: nil)
        path = '/edges/https/%{edge_id}/routes/%{id}/backend'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointBackend.new(client: self, result: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::EndpointBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-backend-module-get
      def get(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/backend'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointBackend.new(client: self, result: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::EndpointBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-backend-module-get
      def get!(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/backend'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointBackend.new(client: self, result: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-backend-module-delete
      def delete(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/backend'
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
      # https://ngrok.com/docs/api#api-edge-route-backend-module-delete
      def delete!(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/backend'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
