# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # A Weighted Backend balances traffic among the referenced backends. Traffic
    #  is assigned proportionally to each based on its weight. The percentage of
    #  traffic is calculated by dividing a backend's weight by the sum of all
    #  weights.
    #
    # https://ngrok.com/docs/api#api-weighted-backends
    class WeightedBackendsClient
      # The API path for the requests
      PATH = '/backends/weighted'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'backends'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new Weighted backend
      #
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [Map<string, int64>] backends the ids of the child backends to their weights (0-10000)
      # @return [NgrokAPI::Models::WeightedBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-weighted-backends-create
      def create(description: "", metadata: "", backends: {})
        path = '/backends/weighted'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:backends] = backends if backends
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::WeightedBackend.new(client: self, result: result)
      end

      ##
      # Delete a Weighted backend by ID. TODO what if used?
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-weighted-backends-delete
      def delete(id: "")
        path = '/backends/weighted/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a Weighted backend by ID. TODO what if used?
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-weighted-backends-delete
      def delete!(id: "")
        path = '/backends/weighted/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about a Weighted backend by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::WeightedBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-weighted-backends-get
      def get(id: "")
        path = '/backends/weighted/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::WeightedBackend.new(client: self, result: result)
      end

      ##
      # Get detailed information about a Weighted backend by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::WeightedBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-weighted-backends-get
      def get!(id: "")
        path = '/backends/weighted/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::WeightedBackend.new(client: self, result: result)
      end

      ##
      # List all Weighted backends on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-weighted-backends-list
      def list(before_id: nil, limit: nil,
               url: nil)
        result = @client.list(
          before_id: before_id,
          limit: limit,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::WeightedBackend
        )
      end

      ##
      # List all Weighted backends on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-weighted-backends-list
      def list!(before_id: nil, limit: nil,
                url: nil)
        result = @client.list(
          before_id: before_id,
          limit: limit,
          danger: true,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::WeightedBackend,
          danger: true
        )
      end

      ##
      # Update Weighted backend by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [Map<string, int64>] backends the ids of the child backends to their weights (0-10000)
      # @return [NgrokAPI::Models::WeightedBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-weighted-backends-update
      def update(id: "", description: nil, metadata: nil, backends: {})
        path = '/backends/weighted/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:backends] = backends if backends
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::WeightedBackend.new(client: self, result: result)
      end

      ##
      # Update Weighted backend by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [Map<string, int64>] backends the ids of the child backends to their weights (0-10000)
      # @return [NgrokAPI::Models::WeightedBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-weighted-backends-update
      def update!(id: "", description: nil, metadata: nil, backends: {})
        path = '/backends/weighted/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:backends] = backends if backends
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::WeightedBackend.new(client: self, result: result)
      end
    end
  end
end
