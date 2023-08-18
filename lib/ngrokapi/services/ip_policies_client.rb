# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # IP Policies are reusable groups of CIDR ranges with an `allow` or `deny`
    #  action. They can be attached to endpoints via the Endpoint Configuration IP
    #  Policy module. They can also be used with IP Restrictions to control source
    #  IP ranges that can start tunnel sessions and connect to the API and dashboard.
    #
    # https://ngrok.com/docs/api#api-ip-policies
    class IPPoliciesClient
      # The API path for the requests
      PATH = '/ip_policies'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'ip_policies'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new IP policy. It will not apply to any traffic until you associate to
      # a traffic source via an endpoint configuration or IP restriction.
      #
      # @param [string] description human-readable description of the source IPs of this IP policy. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP policy. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::IPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policies-create
      def create(description: "", metadata: "", action: nil)
        path = '/ip_policies'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::IPPolicy.new(client: self, attrs: result)
      end

      ##
      # Create a new IP policy. It will not apply to any traffic until you associate to
      # a traffic source via an endpoint configuration or IP restriction.
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of the source IPs of this IP policy. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP policy. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::IPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policies-create
      def create!(description: "", metadata: "", action: nil)
        path = '/ip_policies'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::IPPolicy.new(client: self, attrs: result)
      end

      ##
      # Delete an IP policy. If the IP policy is referenced by another object for the
      # purposes of traffic restriction it will be treated as if the IP policy remains
      # but has zero rules.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policies-delete
      def delete(id: "")
        path = '/ip_policies/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an IP policy. If the IP policy is referenced by another object for the
      # purposes of traffic restriction it will be treated as if the IP policy remains
      # but has zero rules.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policies-delete
      def delete!(id: "")
        path = '/ip_policies/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about an IP policy by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::IPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policies-get
      def get(id: "")
        path = '/ip_policies/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::IPPolicy.new(client: self, attrs: result)
      end

      ##
      # Get detailed information about an IP policy by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::IPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policies-get
      def get!(id: "")
        path = '/ip_policies/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::IPPolicy.new(client: self, attrs: result)
      end

      ##
      # List all IP policies on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policies-list
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
          klass: NgrokAPI::Models::IPPolicy
        )
      end

      ##
      # List all IP policies on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policies-list
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
          klass: NgrokAPI::Models::IPPolicy,
          danger: true
        )
      end

      ##
      # Update attributes of an IP policy by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of the source IPs of this IP policy. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP policy. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::IPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policies-update
      def update(id: "", description: nil, metadata: nil)
        path = '/ip_policies/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::IPPolicy.new(client: self, attrs: result)
      end

      ##
      # Update attributes of an IP policy by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of the source IPs of this IP policy. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP policy. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::IPPolicy] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policies-update
      def update!(id: "", description: nil, metadata: nil)
        path = '/ip_policies/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::IPPolicy.new(client: self, attrs: result)
      end
    end
  end
end
