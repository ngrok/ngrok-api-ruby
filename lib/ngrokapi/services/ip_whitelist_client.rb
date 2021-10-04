# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # The IP Whitelist is deprecated and will be removed. Use an IP Restriction
    #  with an endpoints type instead.
    #
    # https://ngrok.com/docs/api#api-ip-whitelist
    class IPWhitelistClient
      # The API path for the requests
      PATH = '/ip_whitelist'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'whitelist'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new IP whitelist entry that will restrict traffic to all tunnel
      # endpoints on the account.
      #
      # @param [string] description human-readable description of the source IPs for this IP whitelist entry. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP whitelist entry. optional, max 4096 bytes.
      # @param [string] ip_net an IP address or IP network range in CIDR notation (e.g. 10.1.1.1 or 10.1.0.0/16) of addresses that will be whitelisted to communicate with your tunnel endpoints
      # @return [NgrokAPI::Models::IPWhitelistEntry] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-whitelist-create
      def create(
        description: "",
        metadata: "",
        ip_net: ""
      )
        path = '/ip_whitelist'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:ip_net] = ip_net if ip_net
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::IPWhitelistEntry.new(client: self, result: result)
      end

      ##
      # Delete an IP whitelist entry.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-whitelist-delete
      def delete(
        id: ""
      )
        path = '/ip_whitelist/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an IP whitelist entry.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-whitelist-delete
      def delete!(
        id: ""
      )
        path = '/ip_whitelist/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about an IP whitelist entry by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::IPWhitelistEntry] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-whitelist-get
      def get(
        id: ""
      )
        path = '/ip_whitelist/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::IPWhitelistEntry.new(client: self, result: result)
      end

      ##
      # Get detailed information about an IP whitelist entry by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::IPWhitelistEntry] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-whitelist-get
      def get!(
        id: ""
      )
        path = '/ip_whitelist/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::IPWhitelistEntry.new(client: self, result: result)
      end

      ##
      # List all IP whitelist entries on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-whitelist-list
      def list(
        before_id: nil,
        limit: nil,
        url: nil
      )
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
          klass: NgrokAPI::Models::IPWhitelistEntry
        )
      end

      ##
      # Update attributes of an IP whitelist entry by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of the source IPs for this IP whitelist entry. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP whitelist entry. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::IPWhitelistEntry] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-whitelist-update
      def update(
        id: "",
        description: nil,
        metadata: nil
      )
        path = '/ip_whitelist/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::IPWhitelistEntry.new(client: self, result: result)
      end

      ##
      # Update attributes of an IP whitelist entry by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of the source IPs for this IP whitelist entry. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this IP whitelist entry. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::IPWhitelistEntry] result from the API request
      #
      # https://ngrok.com/docs/api#api-ip-whitelist-update
      def update!(
        id: "",
        description: nil,
        metadata: nil
      )
        path = '/ip_whitelist/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::IPWhitelistEntry.new(client: self, result: result)
      end
    end
  end
end
