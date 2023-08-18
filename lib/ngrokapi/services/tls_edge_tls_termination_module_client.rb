# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-tls-edge-tls-termination-module
    class TLSEdgeTLSTerminationModuleClient
      # The API path for the requests
      PATH = '/edges/tls/%{id}/tls_termination'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointTLSTermination] a_module
      # @return [NgrokAPI::Models::EndpointTLSTermination] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-tls-termination-module-replace
      def replace(id: "", a_module: nil)
        path = '/edges/tls/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointTLSTermination.new(client: self, attrs: result)
      end

      ##
      # @param [string] id
      # @param [EndpointTLSTermination] a_module
      # @return [NgrokAPI::Models::EndpointTLSTermination] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-tls-termination-module-replace
      def replace!(id: "", a_module: nil)
        path = '/edges/tls/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointTLSTermination.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointTLSTermination] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-tls-termination-module-get
      def get(id: "")
        path = '/edges/tls/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointTLSTermination.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointTLSTermination] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-tls-termination-module-get
      def get!(id: "")
        path = '/edges/tls/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointTLSTermination.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-tls-termination-module-delete
      def delete(id: "")
        path = '/edges/tls/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-tls-termination-module-delete
      def delete!(id: "")
        path = '/edges/tls/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
