# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # TLS Certificates are pairs of x509 certificates and their matching private
    #  key that can be used to terminate TLS traffic. TLS certificates are unused
    #  until they are attached to a Domain. TLS Certificates may also be
    #  provisioned by ngrok automatically for domains on which you have enabled
    #  automated certificate provisioning.
    #
    # https://ngrok.com/docs/api#api-tls-certificates
    class TLSCertificatesClient
      # The API path for the requests
      PATH = '/tls_certificates'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'tls_certificates'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Upload a new TLS certificate
      #
      # @param [string] description human-readable description of this TLS certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this TLS certificate. optional, max 4096 bytes.
      # @param [string] certificate_pem chain of PEM-encoded certificates, leaf first. See `Certificate Bundles` <https://ngrok.com/docs/api#tls-certificates-pem>`_.
      # @param [string] private_key_pem private key for the TLS certificate, PEM-encoded. See `Private Keys` <https://ngrok.com/docs/ngrok-link#tls-certificates-key>`_.
      # @return [NgrokAPI::Models::TLSCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-create
      def create(description: "", metadata: "", certificate_pem:, private_key_pem:)
        path = '/tls_certificates'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:certificate_pem] = certificate_pem if certificate_pem
        data[:private_key_pem] = private_key_pem if private_key_pem
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::TLSCertificate.new(client: self, result: result)
      end

      ##
      # Delete a TLS certificate
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-delete
      def delete(id: "")
        path = '/tls_certificates/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a TLS certificate
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-delete
      def delete!(id: "")
        path = '/tls_certificates/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about a TLS certificate
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::TLSCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-get
      def get(id: "")
        path = '/tls_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::TLSCertificate.new(client: self, result: result)
      end

      ##
      # Get detailed information about a TLS certificate
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::TLSCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-get
      def get!(id: "")
        path = '/tls_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::TLSCertificate.new(client: self, result: result)
      end

      ##
      # List all TLS certificates on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-list
      def list(before_id: nil, limit: nil,
               url: nil)
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
          klass: NgrokAPI::Models::TLSCertificate
        )
      end

      ##
      # List all TLS certificates on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-list
      def list!(before_id: nil, limit: nil,
                url: nil)
        result = @client.list(
          before_id: before_id,
          limit: limit,
          danger: true,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::TLSCertificate,
          danger: true
        )
      end

      ##
      # Update attributes of a TLS Certificate by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of this TLS certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this TLS certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::TLSCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-update
      def update(id: "", description: nil, metadata: nil)
        path = '/tls_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::TLSCertificate.new(client: self, result: result)
      end

      ##
      # Update attributes of a TLS Certificate by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of this TLS certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this TLS certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::TLSCertificate] result from the API request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-update
      def update!(id: "", description: nil, metadata: nil)
        path = '/tls_certificates/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::TLSCertificate.new(client: self, result: result)
      end
    end
  end
end
