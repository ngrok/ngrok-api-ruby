# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-edges-https
    class EdgesHTTPSClient
      # The API path for the requests
      PATH = '/edges/https'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'https_edges'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create an HTTPS Edge
      #
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge; optional, max 4096 bytes.
      # @param [List<string>] hostports hostports served by this edge
      # @param [EndpointMutualTLSMutate] mutual_tls edge modules
      # @param [EndpointTLSTerminationAtEdge] tls_termination
      # @return [NgrokAPI::Models::HTTPSEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-create
      def create(description: "", metadata: "", hostports: nil, mutual_tls: nil, tls_termination: nil)
        path = '/edges/https'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:hostports] = hostports if hostports
        data[:mutual_tls] = mutual_tls if mutual_tls
        data[:tls_termination] = tls_termination if tls_termination
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::HTTPSEdge.new(client: self, attrs: result)
      end

      ##
      # Create an HTTPS Edge
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge; optional, max 4096 bytes.
      # @param [List<string>] hostports hostports served by this edge
      # @param [EndpointMutualTLSMutate] mutual_tls edge modules
      # @param [EndpointTLSTerminationAtEdge] tls_termination
      # @return [NgrokAPI::Models::HTTPSEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-create
      def create!(description: "", metadata: "", hostports: nil, mutual_tls: nil, tls_termination: nil)
        path = '/edges/https'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:hostports] = hostports if hostports
        data[:mutual_tls] = mutual_tls if mutual_tls
        data[:tls_termination] = tls_termination if tls_termination
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::HTTPSEdge.new(client: self, attrs: result)
      end

      ##
      # Get an HTTPS Edge by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::HTTPSEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-get
      def get(id: "")
        path = '/edges/https/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::HTTPSEdge.new(client: self, attrs: result)
      end

      ##
      # Get an HTTPS Edge by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::HTTPSEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-get
      def get!(id: "")
        path = '/edges/https/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::HTTPSEdge.new(client: self, attrs: result)
      end

      ##
      # Returns a list of all HTTPS Edges on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-list
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
          klass: NgrokAPI::Models::HTTPSEdge
        )
      end

      ##
      # Returns a list of all HTTPS Edges on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-list
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
          klass: NgrokAPI::Models::HTTPSEdge,
          danger: true
        )
      end

      ##
      # Updates an HTTPS Edge by ID. If a module is not specified in the update, it will
      # not be modified. However, each module configuration that is specified will
      # completely replace the existing value. There is no way to delete an existing
      # module via this API, instead use the delete module API.
      #
      # @param [string] id unique identifier of this edge
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge; optional, max 4096 bytes.
      # @param [List<string>] hostports hostports served by this edge
      # @param [EndpointMutualTLSMutate] mutual_tls edge modules
      # @param [EndpointTLSTerminationAtEdge] tls_termination
      # @return [NgrokAPI::Models::HTTPSEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-update
      def update(id: "", description: nil, metadata: nil, hostports: nil, mutual_tls: nil, tls_termination: nil)
        path = '/edges/https/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:hostports] = hostports if hostports
        data[:mutual_tls] = mutual_tls if mutual_tls
        data[:tls_termination] = tls_termination if tls_termination
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::HTTPSEdge.new(client: self, attrs: result)
      end

      ##
      # Updates an HTTPS Edge by ID. If a module is not specified in the update, it will
      # not be modified. However, each module configuration that is specified will
      # completely replace the existing value. There is no way to delete an existing
      # module via this API, instead use the delete module API.
      # Throws an exception if API error.
      #
      # @param [string] id unique identifier of this edge
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge; optional, max 4096 bytes.
      # @param [List<string>] hostports hostports served by this edge
      # @param [EndpointMutualTLSMutate] mutual_tls edge modules
      # @param [EndpointTLSTerminationAtEdge] tls_termination
      # @return [NgrokAPI::Models::HTTPSEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-update
      def update!(id: "", description: nil, metadata: nil, hostports: nil, mutual_tls: nil, tls_termination: nil)
        path = '/edges/https/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:hostports] = hostports if hostports
        data[:mutual_tls] = mutual_tls if mutual_tls
        data[:tls_termination] = tls_termination if tls_termination
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::HTTPSEdge.new(client: self, attrs: result)
      end

      ##
      # Delete an HTTPS Edge by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-delete
      def delete(id: "")
        path = '/edges/https/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an HTTPS Edge by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-delete
      def delete!(id: "")
        path = '/edges/https/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
