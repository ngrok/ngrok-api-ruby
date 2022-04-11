# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-tcp-edge-backend-module
    class TCPEdgeBackendModuleClient
      # The API path for the requests
      PATH = '/edges/tcp/%{id}/backend'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointBackendMutate] a_module
      # @return [NgrokAPI::Models::EndpointBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-backend-module-replace
      def replace(id: "", a_module: nil)
        path = '/edges/tcp/%{id}/backend'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointBackend.new(client: self, attrs: result)
      end

      ##
      # @param [string] id
      # @param [EndpointBackendMutate] a_module
      # @return [NgrokAPI::Models::EndpointBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-backend-module-replace
      def replace!(id: "", a_module: nil)
        path = '/edges/tcp/%{id}/backend'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointBackend.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-backend-module-get
      def get(id: "")
        path = '/edges/tcp/%{id}/backend'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointBackend.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-backend-module-get
      def get!(id: "")
        path = '/edges/tcp/%{id}/backend'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointBackend.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-backend-module-delete
      def delete(id: "")
        path = '/edges/tcp/%{id}/backend'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-backend-module-delete
      def delete!(id: "")
        path = '/edges/tcp/%{id}/backend'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
