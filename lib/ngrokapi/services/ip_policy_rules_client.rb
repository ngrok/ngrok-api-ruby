# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # IP Policy Rules are the IPv4 or IPv6 CIDRs entries that
    #  make up an IP Policy.
    #
    # https://ngrok.com/docs/api#api-ip-policy-rules
    class IPPolicyRulesClient
      # The API path for the requests
      PATH = '/ip_policy_rules'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'ip_policy_rules'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new IP policy rule attached to an IP Policy.
      #
      # @param [string] description human-readable description of the source IPs of this IP rule. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP policy rule. optional, max 4096 bytes.
      # @param [string] cidr an IP or IP range specified in CIDR notation. IPv4 and IPv6 are both supported.
      # @param [string] ip_policy_id ID of the IP policy this IP policy rule will be attached to
      # @param [string] action the action to apply to the policy rule, either ``allow`` or ``deny``
      # @return [NgrokAPI::Models::IPPolicyRule] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-create
      def create(description: "", metadata: "", cidr:, ip_policy_id:, action:)
        path = '/ip_policy_rules'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:cidr] = cidr if cidr
        data[:ip_policy_id] = ip_policy_id if ip_policy_id
        data[:action] = action if action
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::IPPolicyRule.new(client: self, attrs: result)
      end

      ##
      # Create a new IP policy rule attached to an IP Policy.
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of the source IPs of this IP rule. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP policy rule. optional, max 4096 bytes.
      # @param [string] cidr an IP or IP range specified in CIDR notation. IPv4 and IPv6 are both supported.
      # @param [string] ip_policy_id ID of the IP policy this IP policy rule will be attached to
      # @param [string] action the action to apply to the policy rule, either ``allow`` or ``deny``
      # @return [NgrokAPI::Models::IPPolicyRule] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-create
      def create!(description: "", metadata: "", cidr:, ip_policy_id:, action:)
        path = '/ip_policy_rules'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:cidr] = cidr if cidr
        data[:ip_policy_id] = ip_policy_id if ip_policy_id
        data[:action] = action if action
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::IPPolicyRule.new(client: self, attrs: result)
      end

      ##
      # Delete an IP policy rule.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-delete
      def delete(id: "")
        path = '/ip_policy_rules/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an IP policy rule.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-delete
      def delete!(id: "")
        path = '/ip_policy_rules/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about an IP policy rule by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::IPPolicyRule] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-get
      def get(id: "")
        path = '/ip_policy_rules/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::IPPolicyRule.new(client: self, attrs: result)
      end

      ##
      # Get detailed information about an IP policy rule by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::IPPolicyRule] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-get
      def get!(id: "")
        path = '/ip_policy_rules/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::IPPolicyRule.new(client: self, attrs: result)
      end

      ##
      # List all IP policy rules on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-list
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
          klass: NgrokAPI::Models::IPPolicyRule
        )
      end

      ##
      # List all IP policy rules on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-list
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
          klass: NgrokAPI::Models::IPPolicyRule,
          danger: true
        )
      end

      ##
      # Update attributes of an IP policy rule by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of the source IPs of this IP rule. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP policy rule. optional, max 4096 bytes.
      # @param [string] cidr an IP or IP range specified in CIDR notation. IPv4 and IPv6 are both supported.
      # @return [NgrokAPI::Models::IPPolicyRule] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-update
      def update(id: "", description: nil, metadata: nil, cidr: nil)
        path = '/ip_policy_rules/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:cidr] = cidr if cidr
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::IPPolicyRule.new(client: self, attrs: result)
      end

      ##
      # Update attributes of an IP policy rule by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of the source IPs of this IP rule. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP policy rule. optional, max 4096 bytes.
      # @param [string] cidr an IP or IP range specified in CIDR notation. IPv4 and IPv6 are both supported.
      # @return [NgrokAPI::Models::IPPolicyRule] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-update
      def update!(id: "", description: nil, metadata: nil, cidr: nil)
        path = '/ip_policy_rules/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:cidr] = cidr if cidr
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::IPPolicyRule.new(client: self, attrs: result)
      end
    end
  end
end
