# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-endpoint-logging-module
    class EndpointLoggingModuleClient
      # The API path for the requests
      PATH = '/endpoint_configurations/%{id}/logging'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointLoggingMutate] a_module
      # @return [NgrokAPI::Models::EndpointLogging] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-logging-module-replace
      def replace(
        id: "",
        a_module: nil
      )
        path = '/endpoint_configurations/%{id}/logging'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointLogging.new(client: self, result: result)
      end

      ##
      # @param [string] id
      # @param [EndpointLoggingMutate] a_module
      # @return [NgrokAPI::Models::EndpointLogging] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-logging-module-replace
      def replace!(
        id: "",
        a_module: nil
      )
        path = '/endpoint_configurations/%{id}/logging'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointLogging.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointLogging] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-logging-module-get
      def get(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/logging'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointLogging.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointLogging] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-logging-module-get
      def get!(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/logging'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointLogging.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-logging-module-delete
      def delete(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/logging'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-logging-module-delete
      def delete!(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/logging'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
