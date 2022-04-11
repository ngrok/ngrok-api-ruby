# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-tls-edge-ip-restriction-module
    class TLSEdgeIPRestrictionModuleClient
      # The API path for the requests
      PATH = '/edges/tls/%{id}/ip_restriction'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointIPPolicyMutate] a_module
      # @return [NgrokAPI::Models::EndpointIPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-ip-restriction-module-replace
      def replace(id: "", a_module: nil)
        path = '/edges/tls/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointIPPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id
      # @param [EndpointIPPolicyMutate] a_module
      # @return [NgrokAPI::Models::EndpointIPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-ip-restriction-module-replace
      def replace!(id: "", a_module: nil)
        path = '/edges/tls/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        data = a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointIPPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointIPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-ip-restriction-module-get
      def get(id: "")
        path = '/edges/tls/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointIPPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointIPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-ip-restriction-module-get
      def get!(id: "")
        path = '/edges/tls/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointIPPolicy.new(client: self, attrs: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-ip-restriction-module-delete
      def delete(id: "")
        path = '/edges/tls/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-edge-ip-restriction-module-delete
      def delete!(id: "")
        path = '/edges/tls/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
