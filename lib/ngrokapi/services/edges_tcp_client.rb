# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-edges-tcp
    class EdgesTCPClient
      # The API path for the requests
      PATH = '/edges/tcp'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'tcp_edges'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a TCP Edge
      #
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge. Optional, max 4096 bytes.
      # @param [List<string>] hostports hostports served by this edge
      # @param [EndpointBackendMutate] backend edge modules
      # @param [EndpointIPPolicyMutate] ip_restriction
      # @param [EndpointPolicy] policy the traffic policy associated with this edge or null
      # @return [NgrokAPI::Models::TCPEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-tcp-create
      def create(description: "", metadata: "", hostports: nil, backend: nil, ip_restriction: nil, policy: nil)
        path = '/edges/tcp'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:hostports] = hostports if hostports
        data[:backend] = backend if backend
        data[:ip_restriction] = ip_restriction if ip_restriction
        data[:policy] = policy if policy
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::TCPEdge.new(client: self, attrs: result)
      end

      ##
      # Create a TCP Edge
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge. Optional, max 4096 bytes.
      # @param [List<string>] hostports hostports served by this edge
      # @param [EndpointBackendMutate] backend edge modules
      # @param [EndpointIPPolicyMutate] ip_restriction
      # @param [EndpointPolicy] policy the traffic policy associated with this edge or null
      # @return [NgrokAPI::Models::TCPEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-tcp-create
      def create!(description: "", metadata: "", hostports: nil, backend: nil, ip_restriction: nil, policy: nil)
        path = '/edges/tcp'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:hostports] = hostports if hostports
        data[:backend] = backend if backend
        data[:ip_restriction] = ip_restriction if ip_restriction
        data[:policy] = policy if policy
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::TCPEdge.new(client: self, attrs: result)
      end

      ##
      # Get a TCP Edge by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::TCPEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-tcp-get
      def get(id: "")
        path = '/edges/tcp/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::TCPEdge.new(client: self, attrs: result)
      end

      ##
      # Get a TCP Edge by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::TCPEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-tcp-get
      def get!(id: "")
        path = '/edges/tcp/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::TCPEdge.new(client: self, attrs: result)
      end

      ##
      # Returns a list of all TCP Edges on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-tcp-list
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
          klass: NgrokAPI::Models::TCPEdge
        )
      end

      ##
      # Returns a list of all TCP Edges on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-tcp-list
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
          klass: NgrokAPI::Models::TCPEdge,
          danger: true
        )
      end

      ##
      # Updates a TCP Edge by ID. If a module is not specified in the update, it will
      # not be modified. However, each module configuration that is specified will
      # completely replace the existing value. There is no way to delete an existing
      # module via this API, instead use the delete module API.
      #
      # @param [string] id unique identifier of this edge
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge. Optional, max 4096 bytes.
      # @param [List<string>] hostports hostports served by this edge
      # @param [EndpointBackendMutate] backend edge modules
      # @param [EndpointIPPolicyMutate] ip_restriction
      # @param [EndpointPolicy] policy the traffic policy associated with this edge or null
      # @return [NgrokAPI::Models::TCPEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-tcp-update
      def update(id: "", description: nil, metadata: nil, hostports: nil, backend: nil, ip_restriction: nil, policy: nil)
        path = '/edges/tcp/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:hostports] = hostports if hostports
        data[:backend] = backend if backend
        data[:ip_restriction] = ip_restriction if ip_restriction
        data[:policy] = policy if policy
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::TCPEdge.new(client: self, attrs: result)
      end

      ##
      # Updates a TCP Edge by ID. If a module is not specified in the update, it will
      # not be modified. However, each module configuration that is specified will
      # completely replace the existing value. There is no way to delete an existing
      # module via this API, instead use the delete module API.
      # Throws an exception if API error.
      #
      # @param [string] id unique identifier of this edge
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge. Optional, max 4096 bytes.
      # @param [List<string>] hostports hostports served by this edge
      # @param [EndpointBackendMutate] backend edge modules
      # @param [EndpointIPPolicyMutate] ip_restriction
      # @param [EndpointPolicy] policy the traffic policy associated with this edge or null
      # @return [NgrokAPI::Models::TCPEdge] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-tcp-update
      def update!(id: "", description: nil, metadata: nil, hostports: nil, backend: nil, ip_restriction: nil, policy: nil)
        path = '/edges/tcp/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:hostports] = hostports if hostports
        data[:backend] = backend if backend
        data[:ip_restriction] = ip_restriction if ip_restriction
        data[:policy] = policy if policy
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::TCPEdge.new(client: self, attrs: result)
      end

      ##
      # Delete a TCP Edge by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-tcp-delete
      def delete(id: "")
        path = '/edges/tcp/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a TCP Edge by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-tcp-delete
      def delete!(id: "")
        path = '/edges/tcp/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
