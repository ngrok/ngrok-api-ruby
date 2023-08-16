# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # Endpoints provides an API for querying the endpoint objects
    #  which define what tunnel or edge is used to serve a hostport.
    #  Only active endpoints associated with a tunnel or backend are returned.
    #
    # https://ngrok.com/docs/api#api-endpoints
    class EndpointsClient
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'endpoints'
      # The API path for the requests
      PATH = '/endpoints'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # List all active endpoints on the account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-list
      def list(before_id: nil, limit: nil, url: nil)
        result = @client.list(
          before_id: before_id,
          limit: limit,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::Endpoint
        )
      end

      ##
      # List all active endpoints on the account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-list
      def list!(before_id: nil, limit: nil, url: nil)
        result = @client.list(
          before_id: before_id,
          limit: limit,
          danger: true,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::Endpoint,
          danger: true
        )
      end

      ##
      # Get the status of an endpoint by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Endpoint] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-get
      def get(id: "")
        path = '/endpoints/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::Endpoint.new(client: self, attrs: result)
      end

      ##
      # Get the status of an endpoint by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Endpoint] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-get
      def get!(id: "")
        path = '/endpoints/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Endpoint.new(client: self, attrs: result)
      end
    end
  end
end
