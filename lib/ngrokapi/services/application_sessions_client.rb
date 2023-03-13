# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-application-sessions
    class ApplicationSessionsClient
      # The API path for the requests
      PATH = '/app/sessions/%{id}'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'application_sessions'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Get an application session by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ApplicationSession] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-sessions-get
      def get(id: "")
        path = '/app/sessions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::ApplicationSession.new(client: self, attrs: result)
      end

      ##
      # Get an application session by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ApplicationSession] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-sessions-get
      def get!(id: "")
        path = '/app/sessions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::ApplicationSession.new(client: self, attrs: result)
      end

      ##
      # Delete an application session by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-sessions-delete
      def delete(id: "")
        path = '/app/sessions/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an application session by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-sessions-delete
      def delete!(id: "")
        path = '/app/sessions/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # List all application sessions for this account.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-sessions-list
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
          klass: NgrokAPI::Models::ApplicationSession
        )
      end

      ##
      # List all application sessions for this account.
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-application-sessions-list
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
          klass: NgrokAPI::Models::ApplicationSession,
          danger: true
        )
      end
    end
  end
end
