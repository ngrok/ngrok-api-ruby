# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # A static backend sends traffic to a TCP address (hostname and port) that
    #  is reachable on the public internet.
    #
    # https://ngrok.com/docs/api#api-static-backends
    class StaticBackendsClient
      # The API path for the requests
      PATH = '/backends/static'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'backends'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new static backend
      #
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [string] address the address to forward to
      # @param [StaticBackendTLS] tls tls configuration to use
      # @return [NgrokAPI::Models::StaticBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-static-backends-create
      def create(description: "", metadata: "", address: "", tls: nil)
        path = '/backends/static'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:address] = address if address
        data[:tls] = tls if tls
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::StaticBackend.new(client: self, attrs: result)
      end

      ##
      # Create a new static backend
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [string] address the address to forward to
      # @param [StaticBackendTLS] tls tls configuration to use
      # @return [NgrokAPI::Models::StaticBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-static-backends-create
      def create!(description: "", metadata: "", address: "", tls: nil)
        path = '/backends/static'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:address] = address if address
        data[:tls] = tls if tls
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::StaticBackend.new(client: self, attrs: result)
      end

      ##
      # Delete a static backend by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-static-backends-delete
      def delete(id: "")
        path = '/backends/static/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a static backend by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-static-backends-delete
      def delete!(id: "")
        path = '/backends/static/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about a static backend by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::StaticBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-static-backends-get
      def get(id: "")
        path = '/backends/static/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::StaticBackend.new(client: self, attrs: result)
      end

      ##
      # Get detailed information about a static backend by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::StaticBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-static-backends-get
      def get!(id: "")
        path = '/backends/static/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::StaticBackend.new(client: self, attrs: result)
      end

      ##
      # List all static backends on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-static-backends-list
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
          klass: NgrokAPI::Models::StaticBackend
        )
      end

      ##
      # List all static backends on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-static-backends-list
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
          klass: NgrokAPI::Models::StaticBackend,
          danger: true
        )
      end

      ##
      # Update static backend by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [string] address the address to forward to
      # @param [StaticBackendTLS] tls tls configuration to use
      # @return [NgrokAPI::Models::StaticBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-static-backends-update
      def update(id: "", description: nil, metadata: nil, address: "", tls: nil)
        path = '/backends/static/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:address] = address if address
        data[:tls] = tls if tls
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::StaticBackend.new(client: self, attrs: result)
      end

      ##
      # Update static backend by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of this backend. Optional
      # @param [string] metadata arbitrary user-defined machine-readable data of this backend. Optional
      # @param [string] address the address to forward to
      # @param [StaticBackendTLS] tls tls configuration to use
      # @return [NgrokAPI::Models::StaticBackend] result from the API request
      #
      # https://ngrok.com/docs/api#api-static-backends-update
      def update!(id: "", description: nil, metadata: nil, address: "", tls: nil)
        path = '/backends/static/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:address] = address if address
        data[:tls] = tls if tls
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::StaticBackend.new(client: self, attrs: result)
      end
    end
  end
end
