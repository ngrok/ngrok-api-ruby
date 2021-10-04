# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-endpoint-tls-termination-module
    class EndpointTLSTerminationModuleClient
      # The API path for the requests
      PATH = '/endpoint_configurations/%{id}/tls_termination'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointTLSTermination] a_module
      # @return [NgrokAPI::Models::EndpointTLSTermination] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-tls-termination-module-replace
      def replace(
        id: "",
        a_module: nil
      )
        path = '/endpoint_configurations/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointTLSTermination.new(client: self, result: result)
      end

      ##
      # @param [string] id
      # @param [EndpointTLSTermination] a_module
      # @return [NgrokAPI::Models::EndpointTLSTermination] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-tls-termination-module-replace
      def replace!(
        id: "",
        a_module: nil
      )
        path = '/endpoint_configurations/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointTLSTermination.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointTLSTermination] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-tls-termination-module-get
      def get(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointTLSTermination.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointTLSTermination] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-tls-termination-module-get
      def get!(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointTLSTermination.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-tls-termination-module-delete
      def delete(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-tls-termination-module-delete
      def delete!(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/tls_termination'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
