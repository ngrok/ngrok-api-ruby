# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-endpoint-o-auth-module
    class EndpointOAuthModuleClient
      # The API path for the requests
      PATH = '/endpoint_configurations/%{id}/oauth'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointOAuth] a_module
      # @return [NgrokAPI::Models::EndpointOAuth] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-o-auth-module-replace
      def replace(id: "", a_module: nil)
        path = '/endpoint_configurations/%{id}/oauth'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointOAuth.new(client: self, result: result)
      end

      ##
      # @param [string] id
      # @param [EndpointOAuth] a_module
      # @return [NgrokAPI::Models::EndpointOAuth] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-o-auth-module-replace
      def replace!(id: "", a_module: nil)
        path = '/endpoint_configurations/%{id}/oauth'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointOAuth.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointOAuth] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-o-auth-module-get
      def get(id: "")
        path = '/endpoint_configurations/%{id}/oauth'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointOAuth.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointOAuth] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-o-auth-module-get
      def get!(id: "")
        path = '/endpoint_configurations/%{id}/oauth'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointOAuth.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-o-auth-module-delete
      def delete(id: "")
        path = '/endpoint_configurations/%{id}/oauth'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-o-auth-module-delete
      def delete!(id: "")
        path = '/endpoint_configurations/%{id}/oauth'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
