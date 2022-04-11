# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-edge-route-websocket-tcp-converter-module
    class EdgeRouteWebsocketTCPConverterModuleClient
      # The API path for the requests
      PATH = '/edges/https/%{edge_id}/routes/%{id}/websocket_tcp_converter'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] edge_id
      # @param [string] id
      # @param [EndpointWebsocketTCPConverter] a_module
      # @return [NgrokAPI::Models::EndpointWebsocketTCPConverter] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-websocket-tcp-converter-module-replace
      def replace(edge_id: "", id: "", a_module: nil)
        path = '/edges/https/%{edge_id}/routes/%{id}/websocket_tcp_converter'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointWebsocketTCPConverter.new(client: self, attrs: result)
      end

      ##
      # @param [string] edge_id
      # @param [string] id
      # @param [EndpointWebsocketTCPConverter] a_module
      # @return [NgrokAPI::Models::EndpointWebsocketTCPConverter] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-websocket-tcp-converter-module-replace
      def replace!(edge_id: "", id: "", a_module: nil)
        path = '/edges/https/%{edge_id}/routes/%{id}/websocket_tcp_converter'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointWebsocketTCPConverter.new(client: self, attrs: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::EndpointWebsocketTCPConverter] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-websocket-tcp-converter-module-get
      def get(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/websocket_tcp_converter'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointWebsocketTCPConverter.new(client: self, attrs: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::EndpointWebsocketTCPConverter] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-websocket-tcp-converter-module-get
      def get!(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/websocket_tcp_converter'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointWebsocketTCPConverter.new(client: self, attrs: result)
      end

      ##
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-edge-route-websocket-tcp-converter-module-delete
      def delete(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/websocket_tcp_converter'
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
      # https://ngrok.com/docs/api#api-edge-route-websocket-tcp-converter-module-delete
      def delete!(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}/websocket_tcp_converter'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
