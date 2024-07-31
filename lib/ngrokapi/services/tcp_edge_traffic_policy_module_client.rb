# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-tcp-edge-traffic-policy-module
    class TCPEdgeTrafficPolicyModuleClient
      # The API path for the requests
      PATH = '/edges/tcp/%{id}/traffic_policy'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointTrafficPolicy] a_module
      # @return [NgrokAPI::Models::EndpointTrafficPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-traffic-policy-module-replace
      def replace(id: "", a_module: nil)
        path = '/edges/tcp/%{id}/traffic_policy'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointTrafficPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id
      # @param [EndpointTrafficPolicy] a_module
      # @return [NgrokAPI::Models::EndpointTrafficPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-traffic-policy-module-replace
      def replace!(id: "", a_module: nil)
        path = '/edges/tcp/%{id}/traffic_policy'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointTrafficPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointTrafficPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-traffic-policy-module-get
      def get(id: "")
        path = '/edges/tcp/%{id}/traffic_policy'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointTrafficPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointTrafficPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-traffic-policy-module-get
      def get!(id: "")
        path = '/edges/tcp/%{id}/traffic_policy'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointTrafficPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-traffic-policy-module-delete
      def delete(id: "")
        path = '/edges/tcp/%{id}/traffic_policy'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-traffic-policy-module-delete
      def delete!(id: "")
        path = '/edges/tcp/%{id}/traffic_policy'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
