# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # An IP restriction is a restriction placed on the CIDRs that are allowed to
    #  initiate traffic to a specific aspect of your ngrok account. An IP
    #  restriction has a type which defines the ingress it applies to. IP
    #  restrictions can be used to enforce the source IPs that can make API
    #  requests, log in to the dashboard, start ngrok agents, and connect to your
    #  public-facing endpoints.
    #
    # https://ngrok.com/docs/api#api-ip-restrictions
    class IPRestrictionsClient
      # The API path for the requests
      PATH = '/ip_restrictions'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'ip_restrictions'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new IP restriction
      #
      # @param [string] description human-readable description of this IP restriction. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP restriction. optional, max 4096 bytes.
      # @param [boolean] enforced true if the IP restriction will be enforced. if false, only warnings will be issued
      # @param [string] type the type of IP restriction. this defines what traffic will be restricted with the attached policies. four values are currently supported: ``dashboard``, ``api``, ``agent``, and ``endpoints``
      # @param [List<string>] ip_policy_ids the set of IP policy identifiers that are used to enforce the restriction
      # @return [NgrokAPI::Models::IPRestriction] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-create
      def create(description: "", metadata: "", enforced: False, type:, ip_policy_ids:)
        path = '/ip_restrictions'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:enforced] = enforced if enforced
        data[:type] = type if type
        data[:ip_policy_ids] = ip_policy_ids if ip_policy_ids
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::IPRestriction.new(client: self, attrs: result)
      end

      ##
      # Create a new IP restriction
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of this IP restriction. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP restriction. optional, max 4096 bytes.
      # @param [boolean] enforced true if the IP restriction will be enforced. if false, only warnings will be issued
      # @param [string] type the type of IP restriction. this defines what traffic will be restricted with the attached policies. four values are currently supported: ``dashboard``, ``api``, ``agent``, and ``endpoints``
      # @param [List<string>] ip_policy_ids the set of IP policy identifiers that are used to enforce the restriction
      # @return [NgrokAPI::Models::IPRestriction] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-create
      def create!(description: "", metadata: "", enforced: False, type:, ip_policy_ids:)
        path = '/ip_restrictions'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:enforced] = enforced if enforced
        data[:type] = type if type
        data[:ip_policy_ids] = ip_policy_ids if ip_policy_ids
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::IPRestriction.new(client: self, attrs: result)
      end

      ##
      # Delete an IP restriction
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-delete
      def delete(id: "")
        path = '/ip_restrictions/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an IP restriction
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-delete
      def delete!(id: "")
        path = '/ip_restrictions/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about an IP restriction
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::IPRestriction] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-get
      def get(id: "")
        path = '/ip_restrictions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::IPRestriction.new(client: self, attrs: result)
      end

      ##
      # Get detailed information about an IP restriction
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::IPRestriction] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-get
      def get!(id: "")
        path = '/ip_restrictions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::IPRestriction.new(client: self, attrs: result)
      end

      ##
      # List all IP restrictions on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-list
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
          klass: NgrokAPI::Models::IPRestriction
        )
      end

      ##
      # List all IP restrictions on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-list
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
          klass: NgrokAPI::Models::IPRestriction,
          danger: true
        )
      end

      ##
      # Update attributes of an IP restriction by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of this IP restriction. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP restriction. optional, max 4096 bytes.
      # @param [boolean] enforced true if the IP restriction will be enforced. if false, only warnings will be issued
      # @param [List<string>] ip_policy_ids the set of IP policy identifiers that are used to enforce the restriction
      # @return [NgrokAPI::Models::IPRestriction] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-update
      def update(id: "", description: nil, metadata: nil, enforced: nil, ip_policy_ids: [])
        path = '/ip_restrictions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:enforced] = enforced if enforced
        data[:ip_policy_ids] = ip_policy_ids if ip_policy_ids
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::IPRestriction.new(client: self, attrs: result)
      end

      ##
      # Update attributes of an IP restriction by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of this IP restriction. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP restriction. optional, max 4096 bytes.
      # @param [boolean] enforced true if the IP restriction will be enforced. if false, only warnings will be issued
      # @param [List<string>] ip_policy_ids the set of IP policy identifiers that are used to enforce the restriction
      # @return [NgrokAPI::Models::IPRestriction] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-update
      def update!(id: "", description: nil, metadata: nil, enforced: nil, ip_policy_ids: [])
        path = '/ip_restrictions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:enforced] = enforced if enforced
        data[:ip_policy_ids] = ip_policy_ids if ip_policy_ids
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::IPRestriction.new(client: self, attrs: result)
      end
    end
  end
end
