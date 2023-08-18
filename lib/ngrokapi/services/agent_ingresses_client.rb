# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-agent-ingresses
    class AgentIngressesClient
      # The API path for the requests
      PATH = '/agent_ingresses'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'ingresses'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new Agent Ingress. The ngrok agent can be configured to connect to
      # ngrok via the new set of addresses on the returned Agent Ingress.
      #
      # @param [string] description human-readable description of the use of this Agent Ingress. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Agent Ingress. optional, max 4096 bytes
      # @param [string] domain the domain that you own to be used as the base domain name to generate regional agent ingress domains.
      # @return [NgrokAPI::Models::AgentIngress] result from the API request
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-create
      def create(description: "", metadata: "", domain:)
        path = '/agent_ingresses'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:domain] = domain if domain
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::AgentIngress.new(client: self, attrs: result)
      end

      ##
      # Create a new Agent Ingress. The ngrok agent can be configured to connect to
      # ngrok via the new set of addresses on the returned Agent Ingress.
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of the use of this Agent Ingress. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Agent Ingress. optional, max 4096 bytes
      # @param [string] domain the domain that you own to be used as the base domain name to generate regional agent ingress domains.
      # @return [NgrokAPI::Models::AgentIngress] result from the API request
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-create
      def create!(description: "", metadata: "", domain:)
        path = '/agent_ingresses'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:domain] = domain if domain
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::AgentIngress.new(client: self, attrs: result)
      end

      ##
      # Delete an Agent Ingress by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-delete
      def delete(id: "")
        path = '/agent_ingresses/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an Agent Ingress by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-delete
      def delete!(id: "")
        path = '/agent_ingresses/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get the details of an Agent Ingress by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::AgentIngress] result from the API request
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-get
      def get(id: "")
        path = '/agent_ingresses/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::AgentIngress.new(client: self, attrs: result)
      end

      ##
      # Get the details of an Agent Ingress by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::AgentIngress] result from the API request
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-get
      def get!(id: "")
        path = '/agent_ingresses/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::AgentIngress.new(client: self, attrs: result)
      end

      ##
      # List all Agent Ingresses owned by this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-list
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
          klass: NgrokAPI::Models::AgentIngress
        )
      end

      ##
      # List all Agent Ingresses owned by this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-list
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
          klass: NgrokAPI::Models::AgentIngress,
          danger: true
        )
      end

      ##
      # Update attributes of an Agent Ingress by ID.
      #
      # @param [string] id
      # @param [string] description human-readable description of the use of this Agent Ingress. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Agent Ingress. optional, max 4096 bytes
      # @return [NgrokAPI::Models::AgentIngress] result from the API request
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-update
      def update(id: "", description: nil, metadata: nil)
        path = '/agent_ingresses/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::AgentIngress.new(client: self, attrs: result)
      end

      ##
      # Update attributes of an Agent Ingress by ID.
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of the use of this Agent Ingress. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Agent Ingress. optional, max 4096 bytes
      # @return [NgrokAPI::Models::AgentIngress] result from the API request
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-update
      def update!(id: "", description: nil, metadata: nil)
        path = '/agent_ingresses/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::AgentIngress.new(client: self, attrs: result)
      end
    end
  end
end
