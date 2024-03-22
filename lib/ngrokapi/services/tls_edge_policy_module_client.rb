# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-tls-edge-policy-module
    class TLSEdgePolicyModuleClient
      # The API path for the requests
      PATH = '/edges/tls/%{id}/policy'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointPolicy] a_module
      # @return [NgrokAPI::Models::EndpointPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-policy-module-replace
      def replace(id: "", a_module: nil)
        path = '/edges/tls/%{id}/policy'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id
      # @param [EndpointPolicy] a_module
      # @return [NgrokAPI::Models::EndpointPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-policy-module-replace
      def replace!(id: "", a_module: nil)
        path = '/edges/tls/%{id}/policy'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-policy-module-get
      def get(id: "")
        path = '/edges/tls/%{id}/policy'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-policy-module-get
      def get!(id: "")
        path = '/edges/tls/%{id}/policy'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-policy-module-delete
      def delete(id: "")
        path = '/edges/tls/%{id}/policy'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-policy-module-delete
      def delete!(id: "")
        path = '/edges/tls/%{id}/policy'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
