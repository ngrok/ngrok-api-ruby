# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # SSH Host Certificates along with the corresponding private key allows an SSH
    #  server to assert its authenticity to connecting SSH clients who trust the
    #  SSH Certificate Authority that was used to sign the certificate.
    #
    # https://ngrok.com/docs/api#api-ssh-host-certificates
    class SSHHostCertificatesClient
      # The API path for the requests
      PATH = '/ssh_host_certificates'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'ssh_host_certificates'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new SSH Host Certificate
      #
      # @param [string] ssh_certificate_authority_id the ssh certificate authority that is used to sign this ssh host certificate
      # @param [string] public_key a public key in OpenSSH Authorized Keys format that this certificate signs
      # @param [List<string>] principals the list of principals included in the ssh host certificate. This is the list of hostnames and/or IP addresses that are authorized to serve SSH traffic with this certificate. Dangerously, if no principals are specified, this certificate is considered valid for all hosts.
      # @param [datetime (RFC3339 string)] valid_after The time when the host certificate becomes valid, in RFC 3339 format. Defaults to the current time if unspecified.
      # @param [datetime (RFC3339 string)] valid_until The time when this host certificate becomes invalid, in RFC 3339 format. If unspecified, a default value of one year in the future will be used. The OpenSSH certificates RFC calls this ``valid_before``.
      # @param [string] description human-readable description of this SSH Host Certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this SSH Host Certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::SSHHostCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-host-certificates-create
      def create(
        ssh_certificate_authority_id:,
        public_key:,
        principals: [],
        valid_after: "",
        valid_until: "",
        description: "",
        metadata: ""
      )
        path = '/ssh_host_certificates'
        replacements = {
        }
        data = {}
        data[:ssh_certificate_authority_id] = ssh_certificate_authority_id if ssh_certificate_authority_id
        data[:public_key] = public_key if public_key
        data[:principals] = principals if principals
        data[:valid_after] = valid_after if valid_after
        data[:valid_until] = valid_until if valid_until
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::SSHHostCertificate.new(client: self, result: result)
      end

      ##
      # Delete an SSH Host Certificate
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-host-certificates-delete
      def delete(
        id: ""
      )
        path = '/ssh_host_certificates/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an SSH Host Certificate
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-host-certificates-delete
      def delete!(
        id: ""
      )
        path = '/ssh_host_certificates/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about an SSH Host Certficate
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::SSHHostCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-host-certificates-get
      def get(
        id: ""
      )
        path = '/ssh_host_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::SSHHostCertificate.new(client: self, result: result)
      end

      ##
      # Get detailed information about an SSH Host Certficate
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::SSHHostCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-host-certificates-get
      def get!(
        id: ""
      )
        path = '/ssh_host_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::SSHHostCertificate.new(client: self, result: result)
      end

      ##
      # List all SSH Host Certificates issued on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-host-certificates-list
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
          klass: NgrokAPI::Models::SSHHostCertificate
        )
      end

      ##
      # Update an SSH Host Certificate
      #
      # @param [string] id
      # @param [string] description human-readable description of this SSH Host Certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this SSH Host Certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::SSHHostCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-host-certificates-update
      def update(
        id: "",
        description: nil,
        metadata: nil
      )
        path = '/ssh_host_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::SSHHostCertificate.new(client: self, result: result)
      end

      ##
      # Update an SSH Host Certificate
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of this SSH Host Certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this SSH Host Certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::SSHHostCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-host-certificates-update
      def update!(
        id: "",
        description: nil,
        metadata: nil
      )
        path = '/ssh_host_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::SSHHostCertificate.new(client: self, result: result)
      end
    end
  end
end
