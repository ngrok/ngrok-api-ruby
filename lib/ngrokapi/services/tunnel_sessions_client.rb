# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # Tunnel Sessions represent instances of ngrok agents or SSH reverse tunnel
    #  sessions that are running and connected to the ngrok service. Each tunnel
    #  session can include one or more Tunnels.
    #
    # https://ngrok.com/docs/api#api-tunnel-sessions
    class TunnelSessionsClient
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'tunnel_sessions'
      # The API path for the requests
      PATH = '/tunnel_sessions'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # List all online tunnel sessions running on this account.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-sessions-list
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
          klass: NgrokAPI::Models::TunnelSession
        )
      end

      ##
      # Get the detailed status of a tunnel session by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::TunnelSession] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-sessions-get
      def get(
        id: ""
      )
        path = '/tunnel_sessions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::TunnelSession.new(client: self, result: result)
      end

      ##
      # Get the detailed status of a tunnel session by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::TunnelSession] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-sessions-get
      def get!(
        id: ""
      )
        path = '/tunnel_sessions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::TunnelSession.new(client: self, result: result)
      end

      ##
      # Issues a command instructing the ngrok agent to restart. The agent restarts
      # itself by calling exec() on platforms that support it. This operation is notably
      # not supported on Windows. When an agent restarts, it reconnects with a new
      # tunnel session ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-sessions-restart
      def restart(
        id: ""
      )
        path = '/tunnel_sessions/%{id}/restart'
        replacements = {
          id: id,
        }
        @client.post(path % replacements)
      end

      ##
      # Issues a command instructing the ngrok agent to restart. The agent restarts
      # itself by calling exec() on platforms that support it. This operation is notably
      # not supported on Windows. When an agent restarts, it reconnects with a new
      # tunnel session ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-sessions-restart
      def restart!(
        id: ""
      )
        path = '/tunnel_sessions/%{id}/restart'
        replacements = {
          id: id,
        }
        @client.post(path % replacements, danger: true)
      end

      ##
      # Issues a command instructing the ngrok agent that started this tunnel session to
      # exit.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-sessions-stop
      def stop(
        id: ""
      )
        path = '/tunnel_sessions/%{id}/stop'
        replacements = {
          id: id,
        }
        @client.post(path % replacements)
      end

      ##
      # Issues a command instructing the ngrok agent that started this tunnel session to
      # exit.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-sessions-stop
      def stop!(
        id: ""
      )
        path = '/tunnel_sessions/%{id}/stop'
        replacements = {
          id: id,
        }
        @client.post(path % replacements, danger: true)
      end

      ##
      # Issues a command instructing the ngrok agent to update itself to the latest
      # version. After this call completes successfully, the ngrok agent will be in the
      # update process. A caller should wait some amount of time to allow the update to
      # complete (at least 10 seconds) before making a call to the Restart endpoint to
      # request that the agent restart itself to start using the new code. This call
      # will never update an ngrok agent to a new major version which could cause
      # breaking compatibility issues. If you wish to update to a new major version,
      # that must be done manually. Still, please be aware that updating your ngrok
      # agent could break your integration. This call will fail in any of the following
      # circumstances: there is no update available the ngrok agent's configuration
      # disabled update checks the agent is currently in process of updating the agent
      # has already successfully updated but has not yet been restarted
      #
      # @param [string] id
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-sessions-update
      def update(
        id: "",
        version: ""
      )
        path = '/tunnel_sessions/%{id}/update'
        replacements = {
          id: id,
        }
        @client.post(path % replacements)
      end

      ##
      # Issues a command instructing the ngrok agent to update itself to the latest
      # version. After this call completes successfully, the ngrok agent will be in the
      # update process. A caller should wait some amount of time to allow the update to
      # complete (at least 10 seconds) before making a call to the Restart endpoint to
      # request that the agent restart itself to start using the new code. This call
      # will never update an ngrok agent to a new major version which could cause
      # breaking compatibility issues. If you wish to update to a new major version,
      # that must be done manually. Still, please be aware that updating your ngrok
      # agent could break your integration. This call will fail in any of the following
      # circumstances: there is no update available the ngrok agent's configuration
      # disabled update checks the agent is currently in process of updating the agent
      # has already successfully updated but has not yet been restarted
      # Throws an exception if API error.
      #
      # @param [string] id
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tunnel-sessions-update
      def update!(
        id: "",
        version: ""
      )
        path = '/tunnel_sessions/%{id}/update'
        replacements = {
          id: id,
        }
        @client.post(path % replacements, danger: true)
      end
    end
  end
end
