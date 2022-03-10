# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # A Tunnel Group Backend balances traffic among all online tunnels that match
    #  a label selector.
    #
    # https://ngrok.com/docs/api#api-tunnel-group-backends
    class TunnelGroupBackendsClient
      # The API path for the requests
      PATH = '/backends/tunnel_group'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'backends'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new TunnelGroup backend
      #
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [Map<string, string>] labels labels to watch for tunnels on, e.g. app->foo, dc->bar
      # @return [NgrokAPI::Models::TunnelGroupBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-group-backends-create
      def create(description: "", metadata: "", labels: {})
        path = '/backends/tunnel_group'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:labels] = labels if labels
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::TunnelGroupBackend.new(client: self, result: result)
      end

      ##
      # Delete a TunnelGroup backend by ID. TODO what if used?
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-group-backends-delete
      def delete(id: "")
        path = '/backends/tunnel_group/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a TunnelGroup backend by ID. TODO what if used?
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-group-backends-delete
      def delete!(id: "")
        path = '/backends/tunnel_group/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about a TunnelGroup backend by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::TunnelGroupBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-group-backends-get
      def get(id: "")
        path = '/backends/tunnel_group/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::TunnelGroupBackend.new(client: self, result: result)
      end

      ##
      # Get detailed information about a TunnelGroup backend by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::TunnelGroupBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-group-backends-get
      def get!(id: "")
        path = '/backends/tunnel_group/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::TunnelGroupBackend.new(client: self, result: result)
      end

      ##
      # List all TunnelGroup backends on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-group-backends-list
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
          klass: NgrokAPI::Models::TunnelGroupBackend
        )
      end

      ##
      # List all TunnelGroup backends on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-group-backends-list
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
          klass: NgrokAPI::Models::TunnelGroupBackend,
          danger: true
        )
      end

      ##
      # Update TunnelGroup backend by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [Map<string, string>] labels labels to watch for tunnels on, e.g. app->foo, dc->bar
      # @return [NgrokAPI::Models::TunnelGroupBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-group-backends-update
      def update(id: "", description: nil, metadata: nil, labels: {})
        path = '/backends/tunnel_group/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:labels] = labels if labels
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::TunnelGroupBackend.new(client: self, result: result)
      end

      ##
      # Update TunnelGroup backend by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [Map<string, string>] labels labels to watch for tunnels on, e.g. app->foo, dc->bar
      # @return [NgrokAPI::Models::TunnelGroupBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-group-backends-update
      def update!(id: "", description: nil, metadata: nil, labels: {})
        path = '/backends/tunnel_group/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:labels] = labels if labels
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::TunnelGroupBackend.new(client: self, result: result)
      end
    end
  end
end
