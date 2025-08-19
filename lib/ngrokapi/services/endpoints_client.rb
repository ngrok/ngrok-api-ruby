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
      # The API path for the requests
      PATH = '/endpoints'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'endpoints'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create an endpoint, currently available only for cloud endpoints
      #
      # @param [string] url the url of the endpoint
      # @param [string] type Type of endpoint. Only 'cloud' is currently supported (represents a cloud endpoint). Defaults to 'cloud' if not specified.
      # @param [string] traffic_policy The traffic policy attached to this endpoint
      # @param [string] description user-supplied description of the associated tunnel
      # @param [string] metadata user-supplied metadata of the associated tunnel or edge object
      # @param [List<string>] bindings the bindings associated with this endpoint
      # @param [boolean] pooling_enabled
      # @return [NgrokAPI::Models::Endpoint] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-create
      def create(url:, type:, traffic_policy:, description: nil, metadata: nil, bindings: nil, pooling_enabled: False)
        path = '/endpoints'
        replacements = {
        }
        data = {}
        data[:url] = url if url
        data[:type] = type if type
        data[:traffic_policy] = traffic_policy if traffic_policy
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:bindings] = bindings if bindings
        data[:pooling_enabled] = pooling_enabled if pooling_enabled
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::Endpoint.new(client: self, attrs: result)
      end

      ##
      # Create an endpoint, currently available only for cloud endpoints
      # Throws an exception if API error.
      #
      # @param [string] url the url of the endpoint
      # @param [string] type Type of endpoint. Only 'cloud' is currently supported (represents a cloud endpoint). Defaults to 'cloud' if not specified.
      # @param [string] traffic_policy The traffic policy attached to this endpoint
      # @param [string] description user-supplied description of the associated tunnel
      # @param [string] metadata user-supplied metadata of the associated tunnel or edge object
      # @param [List<string>] bindings the bindings associated with this endpoint
      # @param [boolean] pooling_enabled
      # @return [NgrokAPI::Models::Endpoint] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-create
      def create!(url:, type:, traffic_policy:, description: nil, metadata: nil, bindings: nil, pooling_enabled: False)
        path = '/endpoints'
        replacements = {
        }
        data = {}
        data[:url] = url if url
        data[:type] = type if type
        data[:traffic_policy] = traffic_policy if traffic_policy
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:bindings] = bindings if bindings
        data[:pooling_enabled] = pooling_enabled if pooling_enabled
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Endpoint.new(client: self, attrs: result)
      end

      ##
      # List all active endpoints on the account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [List<string>] id
      # @param [List<string>] url
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-list
      def list(
        before_id: nil,
        limit: nil,
        id: [],
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          id: id,
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
      # @param [List<string>] id
      # @param [List<string>] url
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-list
      def list!(
        before_id: nil,
        limit: nil,
        id: [],
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          id: id,
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

      ##
      # Update an Endpoint by ID, currently available only for cloud endpoints
      #
      # @param [string] id unique endpoint resource identifier
      # @param [string] url the url of the endpoint
      # @param [string] traffic_policy The traffic policy attached to this endpoint
      # @param [string] description user-supplied description of the associated tunnel
      # @param [string] metadata user-supplied metadata of the associated tunnel or edge object
      # @param [List<string>] bindings the bindings associated with this endpoint
      # @param [boolean] pooling_enabled
      # @return [NgrokAPI::Models::Endpoint] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-update
      def update(id: "", url: nil, traffic_policy: nil, description: nil, metadata: nil, bindings: nil, pooling_enabled: False)
        path = '/endpoints/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:url] = url if url
        data[:traffic_policy] = traffic_policy if traffic_policy
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:bindings] = bindings if bindings
        data[:pooling_enabled] = pooling_enabled if pooling_enabled
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::Endpoint.new(client: self, attrs: result)
      end

      ##
      # Update an Endpoint by ID, currently available only for cloud endpoints
      # Throws an exception if API error.
      #
      # @param [string] id unique endpoint resource identifier
      # @param [string] url the url of the endpoint
      # @param [string] traffic_policy The traffic policy attached to this endpoint
      # @param [string] description user-supplied description of the associated tunnel
      # @param [string] metadata user-supplied metadata of the associated tunnel or edge object
      # @param [List<string>] bindings the bindings associated with this endpoint
      # @param [boolean] pooling_enabled
      # @return [NgrokAPI::Models::Endpoint] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-update
      def update!(id: "", url: nil, traffic_policy: nil, description: nil, metadata: nil, bindings: nil, pooling_enabled: False)
        path = '/endpoints/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:url] = url if url
        data[:traffic_policy] = traffic_policy if traffic_policy
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:bindings] = bindings if bindings
        data[:pooling_enabled] = pooling_enabled if pooling_enabled
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Endpoint.new(client: self, attrs: result)
      end

      ##
      # Delete an Endpoint by ID, currently available only for cloud endpoints
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-delete
      def delete(id: "")
        path = '/endpoints/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an Endpoint by ID, currently available only for cloud endpoints
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoints-delete
      def delete!(id: "")
        path = '/endpoints/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
