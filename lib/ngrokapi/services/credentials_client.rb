# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # Tunnel Credentials are ngrok agent authtokens. They authorize the ngrok
    #  agent to connect the ngrok service as your account. They are installed with
    #  the `ngrok authtoken` command or by specifying it in the `ngrok.yml`
    #  configuration file with the `authtoken` property.
    #
    # https://ngrok.com/docs/api#api-credentials
    class CredentialsClient
      # The API path for the requests
      PATH = '/credentials'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'credentials'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new tunnel authtoken credential. This authtoken credential can be used
      # to start a new tunnel session. The response to this API call is the only time
      # the generated token is available. If you need it for future use, you must save
      # it securely yourself.
      #
      # @param [string] description human-readable description of who or what will use the credential to authenticate. Optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this credential. Optional, max 4096 bytes.
      # @param [List<string>] acl optional list of ACL rules. If unspecified, the credential will have no restrictions. The only allowed ACL rule at this time is the ``bind`` rule. The ``bind`` rule allows the caller to restrict what domains and addresses the token is allowed to bind. For example, to allow the token to open a tunnel on example.ngrok.io your ACL would include the rule ``bind:example.ngrok.io``. Bind rules may specify a leading wildcard to match multiple domains with a common suffix. For example, you may specify a rule of ``bind:*.example.com`` which will allow ``x.example.com``, ``y.example.com``, ``*.example.com``, etc. A rule of ``'*'`` is equivalent to no acl at all and will explicitly permit all actions.
      # @return [NgrokAPI::Models::Credential] result from the API request
      #
      # https://ngrok.com/docs/api#api-credentials-create
      def create(description: "", metadata: "", acl: [])
        path = '/credentials'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:acl] = acl if acl
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::Credential.new(client: self, attrs: result)
      end

      ##
      # Create a new tunnel authtoken credential. This authtoken credential can be used
      # to start a new tunnel session. The response to this API call is the only time
      # the generated token is available. If you need it for future use, you must save
      # it securely yourself.
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of who or what will use the credential to authenticate. Optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this credential. Optional, max 4096 bytes.
      # @param [List<string>] acl optional list of ACL rules. If unspecified, the credential will have no restrictions. The only allowed ACL rule at this time is the ``bind`` rule. The ``bind`` rule allows the caller to restrict what domains and addresses the token is allowed to bind. For example, to allow the token to open a tunnel on example.ngrok.io your ACL would include the rule ``bind:example.ngrok.io``. Bind rules may specify a leading wildcard to match multiple domains with a common suffix. For example, you may specify a rule of ``bind:*.example.com`` which will allow ``x.example.com``, ``y.example.com``, ``*.example.com``, etc. A rule of ``'*'`` is equivalent to no acl at all and will explicitly permit all actions.
      # @return [NgrokAPI::Models::Credential] result from the API request
      #
      # https://ngrok.com/docs/api#api-credentials-create
      def create!(description: "", metadata: "", acl: [])
        path = '/credentials'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:acl] = acl if acl
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Credential.new(client: self, attrs: result)
      end

      ##
      # Delete a tunnel authtoken credential by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-credentials-delete
      def delete(id: "")
        path = '/credentials/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a tunnel authtoken credential by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-credentials-delete
      def delete!(id: "")
        path = '/credentials/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about a tunnel authtoken credential
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Credential] result from the API request
      #
      # https://ngrok.com/docs/api#api-credentials-get
      def get(id: "")
        path = '/credentials/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::Credential.new(client: self, attrs: result)
      end

      ##
      # Get detailed information about a tunnel authtoken credential
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Credential] result from the API request
      #
      # https://ngrok.com/docs/api#api-credentials-get
      def get!(id: "")
        path = '/credentials/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Credential.new(client: self, attrs: result)
      end

      ##
      # List all tunnel authtoken credentials on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-credentials-list
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
          klass: NgrokAPI::Models::Credential
        )
      end

      ##
      # List all tunnel authtoken credentials on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-credentials-list
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
          klass: NgrokAPI::Models::Credential,
          danger: true
        )
      end

      ##
      # Update attributes of an tunnel authtoken credential by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of who or what will use the credential to authenticate. Optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this credential. Optional, max 4096 bytes.
      # @param [List<string>] acl optional list of ACL rules. If unspecified, the credential will have no restrictions. The only allowed ACL rule at this time is the ``bind`` rule. The ``bind`` rule allows the caller to restrict what domains and addresses the token is allowed to bind. For example, to allow the token to open a tunnel on example.ngrok.io your ACL would include the rule ``bind:example.ngrok.io``. Bind rules may specify a leading wildcard to match multiple domains with a common suffix. For example, you may specify a rule of ``bind:*.example.com`` which will allow ``x.example.com``, ``y.example.com``, ``*.example.com``, etc. A rule of ``'*'`` is equivalent to no acl at all and will explicitly permit all actions.
      # @return [NgrokAPI::Models::Credential] result from the API request
      #
      # https://ngrok.com/docs/api#api-credentials-update
      def update(id: "", description: nil, metadata: nil, acl: nil)
        path = '/credentials/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:acl] = acl if acl
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::Credential.new(client: self, attrs: result)
      end

      ##
      # Update attributes of an tunnel authtoken credential by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of who or what will use the credential to authenticate. Optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this credential. Optional, max 4096 bytes.
      # @param [List<string>] acl optional list of ACL rules. If unspecified, the credential will have no restrictions. The only allowed ACL rule at this time is the ``bind`` rule. The ``bind`` rule allows the caller to restrict what domains and addresses the token is allowed to bind. For example, to allow the token to open a tunnel on example.ngrok.io your ACL would include the rule ``bind:example.ngrok.io``. Bind rules may specify a leading wildcard to match multiple domains with a common suffix. For example, you may specify a rule of ``bind:*.example.com`` which will allow ``x.example.com``, ``y.example.com``, ``*.example.com``, etc. A rule of ``'*'`` is equivalent to no acl at all and will explicitly permit all actions.
      # @return [NgrokAPI::Models::Credential] result from the API request
      #
      # https://ngrok.com/docs/api#api-credentials-update
      def update!(id: "", description: nil, metadata: nil, acl: nil)
        path = '/credentials/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:acl] = acl if acl
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::Credential.new(client: self, attrs: result)
      end
    end
  end
end
