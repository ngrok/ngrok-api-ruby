# frozen_string_literal: true

module NgrokAPI
  module Models
    ##
    # A resource representing data from the tls_certificate API
    class TlsCertificate
      attr_reader :id,
        :client,
        :created_at,
        :description,
        :metadata,
        :result,
        :uri

      def initialize(client:, result:)
        @client = client
        @result = result
        @created_at = @result['created_at']
        @id = @result['id']
        @description = @result['description']
        @metadata = @result['metadata']
        @uri = @result['uri']
      end

      # TODO: equality
      def ==(other)
      end

      # TODO: to_s
      def to_s
      end

      ##
      # Delete this TLS certificate.
      #
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-tls-certificates-delete
      def delete
        @client.delete(id: @id)
      end

      ##
      # Update the attributes of this TLS Certificate.
      #
      # rubocop:disable LineLength
      # @param [string] description human-readable description of this TLS certificate. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this TLS certificate. optional, max 4096 bytes.
      # @return [NgrokAPI::Models::TlsCertificate] result from update request
      # rubocop:enable LineLength
      #
      # https://ngrok.com/docs/api#api-tls-certificates-update
      def update(description: nil, metadata: nil)
        @description = description if description
        @metadata = metadata if metadata
        @client.update(id: @id, description: description, metadata: metadata)
      end
    end
  end
end
