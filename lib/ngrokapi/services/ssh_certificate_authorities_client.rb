# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # An SSH Certificate Authority is a pair of an SSH Certificate and its private
    #  key that can be used to sign other SSH host and user certificates.
    #
    # https://ngrok.com/docs/api#api-ssh-certificate-authorities
    class SSHCertificateAuthoritiesClient
      # The API path for the requests
      PATH = '/ssh_certificate_authorities'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'ssh_certificate_authorities'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new SSH Certificate Authority
      #
      # @param [string] description human-readable description of this SSH Certificate Authority. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this SSH Certificate Authority. optional, max 4096 bytes.
      # @param [string] private_key_type the type of private key to generate. one of ``rsa``, ``ecdsa``, ``ed25519``
      # @param [string] elliptic_curve the type of elliptic curve to use when creating an ECDSA key
      # @param [int64] key_size the key size to use when creating an RSA key. one of ``2048`` or ``4096``
      # @return [NgrokAPI::Models::SSHCertificateAuthority] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-certificate-authorities-create
      def create(
        description: "",
        metadata: "",
        private_key_type: "",
        elliptic_curve: "",
        key_size: 0
      )
        path = '/ssh_certificate_authorities'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:private_key_type] = private_key_type if private_key_type
        data[:elliptic_curve] = elliptic_curve if elliptic_curve
        data[:key_size] = key_size if key_size
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::SSHCertificateAuthority.new(client: self, result: result)
      end

      ##
      # Delete an SSH Certificate Authority
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-certificate-authorities-delete
      def delete(
        id: ""
      )
        path = '/ssh_certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an SSH Certificate Authority
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-certificate-authorities-delete
      def delete!(
        id: ""
      )
        path = '/ssh_certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about an SSH Certficate Authority
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::SSHCertificateAuthority] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-certificate-authorities-get
      def get(
        id: ""
      )
        path = '/ssh_certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::SSHCertificateAuthority.new(client: self, result: result)
      end

      ##
      # Get detailed information about an SSH Certficate Authority
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::SSHCertificateAuthority] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-certificate-authorities-get
      def get!(
        id: ""
      )
        path = '/ssh_certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::SSHCertificateAuthority.new(client: self, result: result)
      end

      ##
      # List all SSH Certificate Authorities on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-certificate-authorities-list
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
          klass: NgrokAPI::Models::SSHCertificateAuthority
        )
      end

      ##
      # Update an SSH Certificate Authority
      #
      # @param [string] id
      # @param [string] description human-readable description of this SSH Certificate Authority. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this SSH Certificate Authority. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::SSHCertificateAuthority] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-certificate-authorities-update
      def update(
        id: "",
        description: nil,
        metadata: nil
      )
        path = '/ssh_certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::SSHCertificateAuthority.new(client: self, result: result)
      end

      ##
      # Update an SSH Certificate Authority
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of this SSH Certificate Authority. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this SSH Certificate Authority. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::SSHCertificateAuthority] result from the API request
      #
      # https://ngrok.com/docs/api#api-ssh-certificate-authorities-update
      def update!(
        id: "",
        description: nil,
        metadata: nil
      )
        path = '/ssh_certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::SSHCertificateAuthority.new(client: self, result: result)
      end
    end
  end
end
