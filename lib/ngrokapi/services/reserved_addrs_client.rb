# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # Reserved Addresses are TCP addresses that can be used to listen for traffic.
    #  TCP address hostnames and ports are assigned by ngrok, they cannot be
    #  chosen.
    #
    # https://ngrok.com/docs/api#api-reserved-addrs
    class ReservedAddrsClient
      # The API path for the requests
      PATH = '/reserved_addrs'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'reserved_addrs'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new reserved address.
      #
      # @param [string] description human-readable description of what this reserved address will be used for
      # @param [string] metadata arbitrary user-defined machine-readable data of this reserved address. Optional, max 4096 bytes.
      # @param [string] region reserve the address in this geographic ngrok datacenter. Optional, default is us. (au, eu, ap, us, jp, in, sa)
      # @return [NgrokAPI::Models::ReservedAddr] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-create
      def create(description: "", metadata: "", region: "", endpoint_configuration_id: nil)
        path = '/reserved_addrs'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:region] = region if region
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::ReservedAddr.new(client: self, attrs: result)
      end

      ##
      # Create a new reserved address.
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of what this reserved address will be used for
      # @param [string] metadata arbitrary user-defined machine-readable data of this reserved address. Optional, max 4096 bytes.
      # @param [string] region reserve the address in this geographic ngrok datacenter. Optional, default is us. (au, eu, ap, us, jp, in, sa)
      # @return [NgrokAPI::Models::ReservedAddr] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-create
      def create!(description: "", metadata: "", region: "", endpoint_configuration_id: nil)
        path = '/reserved_addrs'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:region] = region if region
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::ReservedAddr.new(client: self, attrs: result)
      end

      ##
      # Delete a reserved address.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-delete
      def delete(id: "")
        path = '/reserved_addrs/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a reserved address.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-delete
      def delete!(id: "")
        path = '/reserved_addrs/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get the details of a reserved address.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ReservedAddr] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-get
      def get(id: "")
        path = '/reserved_addrs/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::ReservedAddr.new(client: self, attrs: result)
      end

      ##
      # Get the details of a reserved address.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ReservedAddr] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-get
      def get!(id: "")
        path = '/reserved_addrs/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::ReservedAddr.new(client: self, attrs: result)
      end

      ##
      # List all reserved addresses on this account.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-list
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
          klass: NgrokAPI::Models::ReservedAddr
        )
      end

      ##
      # List all reserved addresses on this account.
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-list
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
          klass: NgrokAPI::Models::ReservedAddr,
          danger: true
        )
      end

      ##
      # Update the attributes of a reserved address.
      #
      # @param [string] id
      # @param [string] description human-readable description of what this reserved address will be used for
      # @param [string] metadata arbitrary user-defined machine-readable data of this reserved address. Optional, max 4096 bytes.
      # @return [NgrokAPI::Models::ReservedAddr] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-update
      def update(id: "", description: nil, metadata: nil, endpoint_configuration_id: nil)
        path = '/reserved_addrs/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::ReservedAddr.new(client: self, attrs: result)
      end

      ##
      # Update the attributes of a reserved address.
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of what this reserved address will be used for
      # @param [string] metadata arbitrary user-defined machine-readable data of this reserved address. Optional, max 4096 bytes.
      # @return [NgrokAPI::Models::ReservedAddr] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-update
      def update!(id: "", description: nil, metadata: nil, endpoint_configuration_id: nil)
        path = '/reserved_addrs/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::ReservedAddr.new(client: self, attrs: result)
      end
    end
  end
end
