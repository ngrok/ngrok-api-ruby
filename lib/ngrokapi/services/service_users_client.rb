# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-service-users
    class ServiceUsersClient
      # The API path for the requests
      PATH = '/service_users'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'service_users'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new service user
      #
      # @param [string] name human-readable name used to identify the service
      # @param [boolean] active whether or not the service is active
      # @return [NgrokAPI::Models::ServiceUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-service-users-create
      def create(name: "", active: nil)
        path = '/service_users'
        replacements = {
        }
        data = {}
        data[:name] = name if name
        data[:active] = active if active
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::ServiceUser.new(client: self, attrs: result)
      end

      ##
      # Create a new service user
      # Throws an exception if API error.
      #
      # @param [string] name human-readable name used to identify the service
      # @param [boolean] active whether or not the service is active
      # @return [NgrokAPI::Models::ServiceUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-service-users-create
      def create!(name: "", active: nil)
        path = '/service_users'
        replacements = {
        }
        data = {}
        data[:name] = name if name
        data[:active] = active if active
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::ServiceUser.new(client: self, attrs: result)
      end

      ##
      # Delete a service user by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-service-users-delete
      def delete(id: "")
        path = '/service_users/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a service user by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-service-users-delete
      def delete!(id: "")
        path = '/service_users/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get the details of a Bot User by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ServiceUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-service-users-get
      def get(id: "")
        path = '/service_users/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::ServiceUser.new(client: self, attrs: result)
      end

      ##
      # Get the details of a Bot User by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ServiceUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-service-users-get
      def get!(id: "")
        path = '/service_users/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::ServiceUser.new(client: self, attrs: result)
      end

      ##
      # List all service users in this account.
      #
      # @param [string] before_id Expects a resource ID as its input. Returns earlier entries in the result set, sorted by ID.
      # @param [string] limit Constrains the number of results in the dataset. See the `API Overview <https://ngrok.com/docs/api/index#pagination>`_ for details.
      # @param [string] filter A CEL expression to filter the list results. Supports logical and comparison operators to match on fields such as ``id``, ``metadata``, ``created_at``, and more. See ngrok API Filtering for syntax and field details: `https://ngrok.com/docs/api/api-filtering <https://ngrok.com/docs/api/api-filtering>`_.
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-service-users-list
      def list(
        before_id: nil,
        limit: nil,
        filter: nil,
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          filter: filter,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::ServiceUser
        )
      end

      ##
      # List all service users in this account.
      # Throws an exception if API error.
      #
      # @param [string] before_id Expects a resource ID as its input. Returns earlier entries in the result set, sorted by ID.
      # @param [string] limit Constrains the number of results in the dataset. See the `API Overview <https://ngrok.com/docs/api/index#pagination>`_ for details.
      # @param [string] filter A CEL expression to filter the list results. Supports logical and comparison operators to match on fields such as ``id``, ``metadata``, ``created_at``, and more. See ngrok API Filtering for syntax and field details: `https://ngrok.com/docs/api/api-filtering <https://ngrok.com/docs/api/api-filtering>`_.
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-service-users-list
      def list!(
        before_id: nil,
        limit: nil,
        filter: nil,
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          filter: filter,
          danger: true,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::ServiceUser,
          danger: true
        )
      end

      ##
      # Update attributes of a service user by ID.
      #
      # @param [string] id
      # @param [string] name human-readable name used to identify the service
      # @param [boolean] active whether or not the service is active
      # @return [NgrokAPI::Models::ServiceUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-service-users-update
      def update(id: "", name: nil, active: nil)
        path = '/service_users/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:name] = name if name
        data[:active] = active if active
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::ServiceUser.new(client: self, attrs: result)
      end

      ##
      # Update attributes of a service user by ID.
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] name human-readable name used to identify the service
      # @param [boolean] active whether or not the service is active
      # @return [NgrokAPI::Models::ServiceUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-service-users-update
      def update!(id: "", name: nil, active: nil)
        path = '/service_users/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:name] = name if name
        data[:active] = active if active
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::ServiceUser.new(client: self, attrs: result)
      end
    end
  end
end
