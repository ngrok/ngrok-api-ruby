# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # A Failover backend defines failover behavior within a list of referenced
    #  backends. Traffic is sent to the first backend in the list. If that backend
    #  is offline or no connection can be established, ngrok attempts to connect to
    #  the next backend in the list until one is successful.
    #
    # https://ngrok.com/docs/api#api-failover-backends
    class FailoverBackendsClient
      # The API path for the requests
      PATH = '/backends/failover'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'backends'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new Failover backend
      #
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [List<string>] backends the ids of the child backends in order
      # @return [NgrokAPI::Models::FailoverBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-failover-backends-create
      def create(description: "", metadata: "", backends: [])
        path = '/backends/failover'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:backends] = backends if backends
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::FailoverBackend.new(client: self, attrs: result)
      end

      ##
      # Create a new Failover backend
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [List<string>] backends the ids of the child backends in order
      # @return [NgrokAPI::Models::FailoverBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-failover-backends-create
      def create!(description: "", metadata: "", backends: [])
        path = '/backends/failover'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:backends] = backends if backends
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::FailoverBackend.new(client: self, attrs: result)
      end

      ##
      # Delete a Failover backend by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-failover-backends-delete
      def delete(id: "")
        path = '/backends/failover/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a Failover backend by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-failover-backends-delete
      def delete!(id: "")
        path = '/backends/failover/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about a Failover backend by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::FailoverBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-failover-backends-get
      def get(id: "")
        path = '/backends/failover/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::FailoverBackend.new(client: self, attrs: result)
      end

      ##
      # Get detailed information about a Failover backend by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::FailoverBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-failover-backends-get
      def get!(id: "")
        path = '/backends/failover/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::FailoverBackend.new(client: self, attrs: result)
      end

      ##
      # List all Failover backends on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-failover-backends-list
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
          klass: NgrokAPI::Models::FailoverBackend
        )
      end

      ##
      # List all Failover backends on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-failover-backends-list
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
          klass: NgrokAPI::Models::FailoverBackend,
          danger: true
        )
      end

      ##
      # Update Failover backend by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [List<string>] backends the ids of the child backends in order
      # @return [NgrokAPI::Models::FailoverBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-failover-backends-update
      def update(id: "", description: nil, metadata: nil, backends: [])
        path = '/backends/failover/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:backends] = backends if backends
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::FailoverBackend.new(client: self, attrs: result)
      end

      ##
      # Update Failover backend by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [List<string>] backends the ids of the child backends in order
      # @return [NgrokAPI::Models::FailoverBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-failover-backends-update
      def update!(id: "", description: nil, metadata: nil, backends: [])
        path = '/backends/failover/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:backends] = backends if backends
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::FailoverBackend.new(client: self, attrs: result)
      end
    end
  end
end
