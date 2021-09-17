# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # A client for interacting with the tls_certificates API
    #
    # https://ngrok.com/docs/api#api-tls-certificates
    class TlsCertificatesClient
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'tls_certificates'
      # The API path for tls certificates
      PATH = '/tls_certificates'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      # rubocop:disable LineLength

      ##
      # Upload a new TLS certificate.
      #
      # @param [string] description human-readable description of this TLS certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this TLS certificate. optional, max 4096 bytes.
      # @param [string] certificate_pem chain of PEM-encoded certificates, leaf first. See `Certificate Bundles` <https://ngrok.com/docs/api#tls-certificates-pem>`_.
      # @param [string] private_key_pem private key for the TLS certificate, PEM-encoded. See `Private Keys` <https://ngrok.com/docs/ngrok-link#tls-certificates-key>`_.
      # @return [NgrokAPI::Models::TlsCertificate] result from create request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-create
      def create(
        certificate_pem: '',
        description: '',
        metadata: '',
        private_key_pem: ''
      )
        data = {
          certificate_pem: certificate_pem,
          description: description,
          metadata: metadata,
          private_key_pem: private_key_pem,
        }
        result = @client.post(PATH, data: data)
        NgrokAPI::Models::TlsCertificate.new(client: self, result: result)
      end
      # rubocop:enable LineLength

      ##
      # Delete a TLS certificate by ID.
      #
      # @param [string] id a resource identifier
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-delete
      def delete(id: nil)
        @client.delete("#{PATH}/#{id}")
      end

      ##
      # Delete a TLS certificate by ID. Throw an exception if 404.
      #
      # @param [string] id a resource identifier
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-delete
      def delete!(id: nil)
        @client.delete("#{PATH}/#{id}", danger: true)
      end

      ##
      # Get detailed information about a TLS certificate by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::TlsCertificate] result from get request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-get
      def get(id: nil)
        result = @client.get("#{PATH}/#{id}")
        NgrokAPI::Models::TlsCertificate.new(client: self, result: result)
      end

      ##
      # Get detailed information about a TLS certificate by ID. Throw an exception if 404.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::TlsCertificate] result from get request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-get
      def get!(id: nil)
        result = @client.get("#{PATH}/#{id}", danger: true)
        NgrokAPI::Models::TlsCertificate.new(client: self, result: result)
      end

      ##
      # List all TLS certificates on this account.
      #
      # @param [string] before_id
      # @param [integer] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] the result listable
      #
      # https://ngrok.com/docs/api#api-tls-certificates-list
      def list(before_id: nil, limit: nil, url: nil)
        result = @client.list(before_id: before_id, limit: limit, url: url, path: PATH)
        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::TlsCertificate
        )
      end

      # rubocop:disable LineLength

      ##
      # Update attributes of a TLS Certificate by ID.
      #
      # @param [string] id
      # @param [string] description human-readable description of this TLS certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this TLS certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::TlsCertificate] result from update request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-update
      def update(
        id: nil,
        description: nil,
        metadata: nil
      )
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch("#{PATH}/#{id}", data: data)
        NgrokAPI::Models::TlsCertificate.new(client: self, result: result)
      end

      ##
      # Update attributes of a TLS Certificate by ID. Throw an exception if 404.
      #
      # @param [string] id
      # @param [string] description human-readable description of this TLS certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this TLS certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::TlsCertificate] result from update request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-update
      def update!(
        id: nil,
        description: nil,
        metadata: nil
      )
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch("#{PATH}/#{id}", danger: true, data: data)
        NgrokAPI::Models::TlsCertificate.new(client: self, result: result)
      end
      # rubocop:enable LineLength
    end
  end
end
