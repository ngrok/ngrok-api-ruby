# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-application-users
    class ApplicationUsersClient
      # The API path for the requests
      PATH = '/app/users/%{id}'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'application_users'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Get an application user by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ApplicationUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-users-get
      def get(id: "")
        path = '/app/users/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::ApplicationUser.new(client: self, attrs: result)
      end

      ##
      # Get an application user by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ApplicationUser] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-users-get
      def get!(id: "")
        path = '/app/users/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::ApplicationUser.new(client: self, attrs: result)
      end

      ##
      # Delete an application user by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-users-delete
      def delete(id: "")
        path = '/app/users/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an application user by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-users-delete
      def delete!(id: "")
        path = '/app/users/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # List all application users for this account.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-users-list
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
          klass: NgrokAPI::Models::ApplicationUser
        )
      end

      ##
      # List all application users for this account.
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-users-list
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
          klass: NgrokAPI::Models::ApplicationUser,
          danger: true
        )
      end
    end
  end
end
