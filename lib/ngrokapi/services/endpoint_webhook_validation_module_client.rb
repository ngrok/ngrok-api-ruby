# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-endpoint-webhook-validation-module
    class EndpointWebhookValidationModuleClient
      # The API path for the requests
      PATH = '/endpoint_configurations/%{id}/webhook_validation'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointWebhookValidation] a_module
      # @return [NgrokAPI::Models::EndpointWebhookValidation] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-webhook-validation-module-replace
      def replace(
        id: "",
        a_module: nil
      )
        path = '/endpoint_configurations/%{id}/webhook_validation'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointWebhookValidation.new(client: self, result: result)
      end

      ##
      # @param [string] id
      # @param [EndpointWebhookValidation] a_module
      # @return [NgrokAPI::Models::EndpointWebhookValidation] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-webhook-validation-module-replace
      def replace!(
        id: "",
        a_module: nil
      )
        path = '/endpoint_configurations/%{id}/webhook_validation'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointWebhookValidation.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointWebhookValidation] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-webhook-validation-module-get
      def get(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/webhook_validation'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointWebhookValidation.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointWebhookValidation] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-webhook-validation-module-get
      def get!(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/webhook_validation'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointWebhookValidation.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-webhook-validation-module-delete
      def delete(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/webhook_validation'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-webhook-validation-module-delete
      def delete!(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/webhook_validation'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
