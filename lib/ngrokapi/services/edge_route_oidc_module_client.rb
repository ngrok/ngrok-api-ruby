# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-edge-route-oidc-module
    class EdgeRouteOIDCModuleClient
      # The API path for the requests
      PATH = '/edges/https/%{edge_id}/routes/%{id}/oidc'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] edge_id
      # @param [string] id
      # @param [EndpointOIDC] a_module
      # @return [NgrokAPI::Models::EndpointOIDC] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-oidc-module-replace
      def replace(edge_id: "", id: "", a_module: nil)
        path = '/edges/https/%{edge_id}/routes/%{id}/oidc'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointOIDC.new(client: self, attrs: result)
      end

      ##
      # @param [string] edge_id
      # @param [string] id
      # @param [EndpointOIDC] a_module
      # @return [NgrokAPI::Models::EndpointOIDC] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-oidc-module-replace
      def replace!(edge_id: "", id: "", a_module: nil)
        path = '/edges/https/%{edge_id}/routes/%{id}/oidc'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointOIDC.new(client: self, attrs: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::EndpointOIDC] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-oidc-module-get
      def get(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/oidc'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointOIDC.new(client: self, attrs: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::EndpointOIDC] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-oidc-module-get
      def get!(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/oidc'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointOIDC.new(client: self, attrs: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-oidc-module-delete
      def delete(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/oidc'
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
      # https://ngrok.com/docs/api#api-edge-route-oidc-module-delete
      def delete!(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/oidc'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
