# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # Certificate Authorities are x509 certificates that are used to sign other
    #  x509 certificates. Attach a Certificate Authority to the Mutual TLS module
    #  to verify that the TLS certificate presented by a client has been signed by
    #  this CA. Certificate Authorities  are used only for mTLS validation only and
    #  thus a private key is not included in the resource.
    #
    # https://ngrok.com/docs/api#api-certificate-authorities
    class CertificateAuthoritiesClient
      # The API path for the requests
      PATH = '/certificate_authorities'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'certificate_authorities'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Upload a new Certificate Authority
      #
      # @param [string] description human-readable description of this Certificate Authority. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Certificate Authority. optional, max 4096 bytes.
      # @param [string] ca_pem raw PEM of the Certificate Authority
      # @return [NgrokAPI::Models::CertificateAuthority] result from the API request
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-create
      def create(description: "", metadata: "", ca_pem:)
        path = '/certificate_authorities'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:ca_pem] = ca_pem if ca_pem
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::CertificateAuthority.new(client: self, attrs: result)
      end

      ##
      # Upload a new Certificate Authority
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of this Certificate Authority. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Certificate Authority. optional, max 4096 bytes.
      # @param [string] ca_pem raw PEM of the Certificate Authority
      # @return [NgrokAPI::Models::CertificateAuthority] result from the API request
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-create
      def create!(description: "", metadata: "", ca_pem:)
        path = '/certificate_authorities'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:ca_pem] = ca_pem if ca_pem
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::CertificateAuthority.new(client: self, attrs: result)
      end

      ##
      # Delete a Certificate Authority
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-delete
      def delete(id: "")
        path = '/certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a Certificate Authority
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-delete
      def delete!(id: "")
        path = '/certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about a certficate authority
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::CertificateAuthority] result from the API request
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-get
      def get(id: "")
        path = '/certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::CertificateAuthority.new(client: self, attrs: result)
      end

      ##
      # Get detailed information about a certficate authority
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::CertificateAuthority] result from the API request
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-get
      def get!(id: "")
        path = '/certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::CertificateAuthority.new(client: self, attrs: result)
      end

      ##
      # List all Certificate Authority on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-list
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
          klass: NgrokAPI::Models::CertificateAuthority
        )
      end

      ##
      # List all Certificate Authority on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-list
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
          klass: NgrokAPI::Models::CertificateAuthority,
          danger: true
        )
      end

      ##
      # Update attributes of a Certificate Authority by ID
      #
      # @param [string] id
      # @param [string] description human-readable description of this Certificate Authority. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Certificate Authority. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::CertificateAuthority] result from the API request
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-update
      def update(id: "", description: nil, metadata: nil)
        path = '/certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::CertificateAuthority.new(client: self, attrs: result)
      end

      ##
      # Update attributes of a Certificate Authority by ID
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of this Certificate Authority. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Certificate Authority. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::CertificateAuthority] result from the API request
      #
      # https://ngrok.com/docs/api#api-certificate-authorities-update
      def update!(id: "", description: nil, metadata: nil)
        path = '/certificate_authorities/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::CertificateAuthority.new(client: self, attrs: result)
      end
    end
  end
end
