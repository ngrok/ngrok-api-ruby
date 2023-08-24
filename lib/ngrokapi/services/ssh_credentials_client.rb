# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # SSH Credentials are SSH public keys that can be used to start SSH tunnels
    #  via the ngrok SSH tunnel gateway.
    #
    # https://ngrok.com/docs/api#api-ssh-credentials
    class SSHCredentialsClient
      # The API path for the requests
      PATH = '/ssh_credentials'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'ssh_credentials'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new ssh_credential from an uploaded public SSH key. This ssh credential
      # can be used to start new tunnels via ngrok's SSH gateway.
      #
      # @param [string] description human-readable description of who or what will use the ssh credential to authenticate. Optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this ssh credential. Optional, max 4096 bytes.
      # @param [List<string>] acl optional list of ACL rules. If unspecified, the credential will have no restrictions. The only allowed ACL rule at this time is the ``bind`` rule. The ``bind`` rule allows the caller to restrict what domains, addresses, and labels the token is allowed to bind. For example, to allow the token to open a tunnel on example.ngrok.io your ACL would include the rule ``bind:example.ngrok.io``. Bind rules for domains may specify a leading wildcard to match multiple domains with a common suffix. For example, you may specify a rule of ``bind:*.example.com`` which will allow ``x.example.com``, ``y.example.com``, ``*.example.com``, etc. Bind rules for labels may specify a wildcard key and/or value to match multiple labels. For example, you may specify a rule of ``bind:*=example`` which will allow ``x=example``, ``y=example``, etc. A rule of ``'*'`` is equivalent to no acl at all and will explicitly permit all actions.
      # @param [string] public_key the PEM-encoded public key of the SSH keypair that will be used to authenticate
      # @param [string] owner_id If supplied at credential creation, ownership will be assigned to the specified User or Bot. Only admins may specify an owner other than themselves. Defaults to the authenticated User or Bot.
      # @return [NgrokAPI::Models::SSHCredential] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-create
      def create(description: "", metadata: "", acl: [], public_key:, owner_id: nil, owner_email: "")
        path = '/ssh_credentials'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:acl] = acl if acl
        data[:public_key] = public_key if public_key
        data[:owner_id] = owner_id if owner_id
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::SSHCredential.new(client: self, attrs: result)
      end

      ##
      # Create a new ssh_credential from an uploaded public SSH key. This ssh credential
      # can be used to start new tunnels via ngrok's SSH gateway.
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of who or what will use the ssh credential to authenticate. Optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this ssh credential. Optional, max 4096 bytes.
      # @param [List<string>] acl optional list of ACL rules. If unspecified, the credential will have no restrictions. The only allowed ACL rule at this time is the ``bind`` rule. The ``bind`` rule allows the caller to restrict what domains, addresses, and labels the token is allowed to bind. For example, to allow the token to open a tunnel on example.ngrok.io your ACL would include the rule ``bind:example.ngrok.io``. Bind rules for domains may specify a leading wildcard to match multiple domains with a common suffix. For example, you may specify a rule of ``bind:*.example.com`` which will allow ``x.example.com``, ``y.example.com``, ``*.example.com``, etc. Bind rules for labels may specify a wildcard key and/or value to match multiple labels. For example, you may specify a rule of ``bind:*=example`` which will allow ``x=example``, ``y=example``, etc. A rule of ``'*'`` is equivalent to no acl at all and will explicitly permit all actions.
      # @param [string] public_key the PEM-encoded public key of the SSH keypair that will be used to authenticate
      # @param [string] owner_id If supplied at credential creation, ownership will be assigned to the specified User or Bot. Only admins may specify an owner other than themselves. Defaults to the authenticated User or Bot.
      # @return [NgrokAPI::Models::SSHCredential] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-create
      def create!(description: "", metadata: "", acl: [], public_key:, owner_id: nil, owner_email: "")
        path = '/ssh_credentials'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:acl] = acl if acl
        data[:public_key] = public_key if public_key
        data[:owner_id] = owner_id if owner_id
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::SSHCredential.new(client: self, attrs: result)
      end

      ##
      # Delete an ssh_credential by ID
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-delete
      def delete(id: "")
        path = '/ssh_credentials/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an ssh_credential by ID
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-delete
      def delete!(id: "")
        path = '/ssh_credentials/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about an ssh_credential
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::SSHCredential] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-get
      def get(id: "")
        path = '/ssh_credentials/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::SSHCredential.new(client: self, attrs: result)
      end

      ##
      # Get detailed information about an ssh_credential
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::SSHCredential] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-get
      def get!(id: "")
        path = '/ssh_credentials/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::SSHCredential.new(client: self, attrs: result)
      end

      ##
      # List all ssh credentials on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-list
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
          klass: NgrokAPI::Models::SSHCredential
        )
      end

      ##
      # List all ssh credentials on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-list
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
          klass: NgrokAPI::Models::SSHCredential,
          danger: true
        )
      end

      ##
      # Update attributes of an ssh_credential by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of who or what will use the ssh credential to authenticate. Optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this ssh credential. Optional, max 4096 bytes.
      # @param [List<string>] acl optional list of ACL rules. If unspecified, the credential will have no restrictions. The only allowed ACL rule at this time is the ``bind`` rule. The ``bind`` rule allows the caller to restrict what domains, addresses, and labels the token is allowed to bind. For example, to allow the token to open a tunnel on example.ngrok.io your ACL would include the rule ``bind:example.ngrok.io``. Bind rules for domains may specify a leading wildcard to match multiple domains with a common suffix. For example, you may specify a rule of ``bind:*.example.com`` which will allow ``x.example.com``, ``y.example.com``, ``*.example.com``, etc. Bind rules for labels may specify a wildcard key and/or value to match multiple labels. For example, you may specify a rule of ``bind:*=example`` which will allow ``x=example``, ``y=example``, etc. A rule of ``'*'`` is equivalent to no acl at all and will explicitly permit all actions.
      # @return [NgrokAPI::Models::SSHCredential] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-update
      def update(id: "", description: nil, metadata: nil, acl: nil)
        path = '/ssh_credentials/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:acl] = acl if acl
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::SSHCredential.new(client: self, attrs: result)
      end

      ##
      # Update attributes of an ssh_credential by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of who or what will use the ssh credential to authenticate. Optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this ssh credential. Optional, max 4096 bytes.
      # @param [List<string>] acl optional list of ACL rules. If unspecified, the credential will have no restrictions. The only allowed ACL rule at this time is the ``bind`` rule. The ``bind`` rule allows the caller to restrict what domains, addresses, and labels the token is allowed to bind. For example, to allow the token to open a tunnel on example.ngrok.io your ACL would include the rule ``bind:example.ngrok.io``. Bind rules for domains may specify a leading wildcard to match multiple domains with a common suffix. For example, you may specify a rule of ``bind:*.example.com`` which will allow ``x.example.com``, ``y.example.com``, ``*.example.com``, etc. Bind rules for labels may specify a wildcard key and/or value to match multiple labels. For example, you may specify a rule of ``bind:*=example`` which will allow ``x=example``, ``y=example``, etc. A rule of ``'*'`` is equivalent to no acl at all and will explicitly permit all actions.
      # @return [NgrokAPI::Models::SSHCredential] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-credentials-update
      def update!(id: "", description: nil, metadata: nil, acl: nil)
        path = '/ssh_credentials/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:acl] = acl if acl
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::SSHCredential.new(client: self, attrs: result)
      end
    end
  end
end
