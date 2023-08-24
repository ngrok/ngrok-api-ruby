# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-https-edge-mutual-tls-module
    class HTTPSEdgeMutualTLSModuleClient
      # The API path for the requests
      PATH = '/edges/https/%{id}/mutual_tls'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointMutualTLSMutate] a_module
      # @return [NgrokAPI::Models::EndpointMutualTLS] result from the API request
      #
      # https://ngrok.com/docs/api#api-https-edge-mutual-tls-module-replace
      def replace(id: "", a_module: nil)
        path = '/edges/https/%{id}/mutual_tls'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointMutualTLS.new(client: self, attrs: result)
      end

      ##
      # @param [string] id
      # @param [EndpointMutualTLSMutate] a_module
      # @return [NgrokAPI::Models::EndpointMutualTLS] result from the API request
      #
      # https://ngrok.com/docs/api#api-https-edge-mutual-tls-module-replace
      def replace!(id: "", a_module: nil)
        path = '/edges/https/%{id}/mutual_tls'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointMutualTLS.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointMutualTLS] result from the API request
      #
      # https://ngrok.com/docs/api#api-https-edge-mutual-tls-module-get
      def get(id: "")
        path = '/edges/https/%{id}/mutual_tls'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointMutualTLS.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointMutualTLS] result from the API request
      #
      # https://ngrok.com/docs/api#api-https-edge-mutual-tls-module-get
      def get!(id: "")
        path = '/edges/https/%{id}/mutual_tls'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointMutualTLS.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-https-edge-mutual-tls-module-delete
      def delete(id: "")
        path = '/edges/https/%{id}/mutual_tls'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-https-edge-mutual-tls-module-delete
      def delete!(id: "")
        path = '/edges/https/%{id}/mutual_tls'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
