# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # SSH User Certificates are presented by SSH clients when connecting to an SSH
    #  server to authenticate their connection. The SSH server must trust the SSH
    #  Certificate Authority used to sign the certificate.
    #
    # https://ngrok.com/docs/api#api-ssh-user-certificates
    class SSHUserCertificatesClient
      # The API path for the requests
      PATH = '/ssh_user_certificates'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'ssh_user_certificates'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new SSH User Certificate
      #
      # @param [string] ssh_certificate_authority_id the ssh certificate authority that is used to sign this ssh user certificate
      # @param [string] public_key a public key in OpenSSH Authorized Keys format that this certificate signs
      # @param [List<string>] principals the list of principals included in the ssh user certificate. This is the list of usernames that the certificate holder may sign in as on a machine authorizing the signing certificate authority. Dangerously, if no principals are specified, this certificate may be used to log in as any user.
      # @param [Map<string, string>] critical_options A map of critical options included in the certificate. Only two critical options are currently defined by OpenSSH: ``force-command`` and ``source-address``. See `the OpenSSH certificate protocol spec <https://github.com/openssh/openssh-portable/blob/master/PROTOCOL.certkeys>`_ for additional details.
      # @param [Map<string, string>] extensions A map of extensions included in the certificate. Extensions are additional metadata that can be interpreted by the SSH server for any purpose. These can be used to permit or deny the ability to open a terminal, do port forwarding, x11 forwarding, and more. If unspecified, the certificate will include limited permissions with the following extension map: ``{"permit-pty": "", "permit-user-rc": ""}`` OpenSSH understands a number of predefined extensions. See `the OpenSSH certificate protocol spec <https://github.com/openssh/openssh-portable/blob/master/PROTOCOL.certkeys>`_ for additional details.
      # @param [datetime (RFC3339 string)] valid_after The time when the user certificate becomes valid, in RFC 3339 format. Defaults to the current time if unspecified.
      # @param [datetime (RFC3339 string)] valid_until The time when this host certificate becomes invalid, in RFC 3339 format. If unspecified, a default value of 24 hours will be used. The OpenSSH certificates RFC calls this ``valid_before``.
      # @param [string] description human-readable description of this SSH User Certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this SSH User Certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::SSHUserCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-create
      def create(ssh_certificate_authority_id:, public_key:, principals: [], critical_options: {}, extensions: {}, valid_after: "", valid_until: "", description: "", metadata: "")
        path = '/ssh_user_certificates'
        replacements = {
        }
        data = {}
        data[:ssh_certificate_authority_id] = ssh_certificate_authority_id if ssh_certificate_authority_id
        data[:public_key] = public_key if public_key
        data[:principals] = principals if principals
        data[:critical_options] = critical_options if critical_options
        data[:extensions] = extensions if extensions
        data[:valid_after] = valid_after if valid_after
        data[:valid_until] = valid_until if valid_until
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::SSHUserCertificate.new(client: self, attrs: result)
      end

      ##
      # Create a new SSH User Certificate
      # Throws an exception if API error.
      #
      # @param [string] ssh_certificate_authority_id the ssh certificate authority that is used to sign this ssh user certificate
      # @param [string] public_key a public key in OpenSSH Authorized Keys format that this certificate signs
      # @param [List<string>] principals the list of principals included in the ssh user certificate. This is the list of usernames that the certificate holder may sign in as on a machine authorizing the signing certificate authority. Dangerously, if no principals are specified, this certificate may be used to log in as any user.
      # @param [Map<string, string>] critical_options A map of critical options included in the certificate. Only two critical options are currently defined by OpenSSH: ``force-command`` and ``source-address``. See `the OpenSSH certificate protocol spec <https://github.com/openssh/openssh-portable/blob/master/PROTOCOL.certkeys>`_ for additional details.
      # @param [Map<string, string>] extensions A map of extensions included in the certificate. Extensions are additional metadata that can be interpreted by the SSH server for any purpose. These can be used to permit or deny the ability to open a terminal, do port forwarding, x11 forwarding, and more. If unspecified, the certificate will include limited permissions with the following extension map: ``{"permit-pty": "", "permit-user-rc": ""}`` OpenSSH understands a number of predefined extensions. See `the OpenSSH certificate protocol spec <https://github.com/openssh/openssh-portable/blob/master/PROTOCOL.certkeys>`_ for additional details.
      # @param [datetime (RFC3339 string)] valid_after The time when the user certificate becomes valid, in RFC 3339 format. Defaults to the current time if unspecified.
      # @param [datetime (RFC3339 string)] valid_until The time when this host certificate becomes invalid, in RFC 3339 format. If unspecified, a default value of 24 hours will be used. The OpenSSH certificates RFC calls this ``valid_before``.
      # @param [string] description human-readable description of this SSH User Certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this SSH User Certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::SSHUserCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-create
      def create!(ssh_certificate_authority_id:, public_key:, principals: [], critical_options: {}, extensions: {}, valid_after: "", valid_until: "", description: "", metadata: "")
        path = '/ssh_user_certificates'
        replacements = {
        }
        data = {}
        data[:ssh_certificate_authority_id] = ssh_certificate_authority_id if ssh_certificate_authority_id
        data[:public_key] = public_key if public_key
        data[:principals] = principals if principals
        data[:critical_options] = critical_options if critical_options
        data[:extensions] = extensions if extensions
        data[:valid_after] = valid_after if valid_after
        data[:valid_until] = valid_until if valid_until
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::SSHUserCertificate.new(client: self, attrs: result)
      end

      ##
      # Delete an SSH User Certificate
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-delete
      def delete(id: "")
        path = '/ssh_user_certificates/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an SSH User Certificate
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-delete
      def delete!(id: "")
        path = '/ssh_user_certificates/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about an SSH User Certificate
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::SSHUserCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-get
      def get(id: "")
        path = '/ssh_user_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::SSHUserCertificate.new(client: self, attrs: result)
      end

      ##
      # Get detailed information about an SSH User Certificate
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::SSHUserCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-get
      def get!(id: "")
        path = '/ssh_user_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::SSHUserCertificate.new(client: self, attrs: result)
      end

      ##
      # List all SSH User Certificates issued on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-list
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
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::SSHUserCertificate
        )
      end

      ##
      # List all SSH User Certificates issued on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-list
      def list!(
        before_id: nil,
        limit: nil,
        url: nil
      )
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
          klass: NgrokAPI::Models::SSHUserCertificate,
          danger: true
        )
      end

      ##
      # Update an SSH User Certificate
      #
      # @param [string] id
      # @param [string] description human-readable description of this SSH User Certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this SSH User Certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::SSHUserCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-update
      def update(id: "", description: nil, metadata: nil)
        path = '/ssh_user_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::SSHUserCertificate.new(client: self, attrs: result)
      end

      ##
      # Update an SSH User Certificate
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of this SSH User Certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this SSH User Certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::SSHUserCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-update
      def update!(id: "", description: nil, metadata: nil)
        path = '/ssh_user_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::SSHUserCertificate.new(client: self, attrs: result)
      end
    end
  end
end
