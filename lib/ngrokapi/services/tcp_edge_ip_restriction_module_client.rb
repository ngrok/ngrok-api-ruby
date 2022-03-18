# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-tcp-edge-ip-restriction-module
    class TCPEdgeIPRestrictionModuleClient
      # The API path for the requests
      PATH = '/edges/tcp/%{id}/ip_restriction'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointIPPolicyMutate] a_module
      # @return [NgrokAPI::Models::EndpointIPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-ip-restriction-module-replace
      def replace(id: "", a_module: nil)
        path = '/edges/tcp/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointIPPolicy.new(client: self, result: result)
      end

      ##
      # @param [string] id
      # @param [EndpointIPPolicyMutate] a_module
      # @return [NgrokAPI::Models::EndpointIPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-ip-restriction-module-replace
      def replace!(id: "", a_module: nil)
        path = '/edges/tcp/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointIPPolicy.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointIPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-ip-restriction-module-get
      def get(id: "")
        path = '/edges/tcp/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointIPPolicy.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointIPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-ip-restriction-module-get
      def get!(id: "")
        path = '/edges/tcp/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointIPPolicy.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-ip-restriction-module-delete
      def delete(id: "")
        path = '/edges/tcp/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tcp-edge-ip-restriction-module-delete
      def delete!(id: "")
        path = '/edges/tcp/%{id}/ip_restriction'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
