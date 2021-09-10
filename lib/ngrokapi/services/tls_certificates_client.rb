# frozen_string_literal: true

module NgrokAPI
  module Services
    class TlsCertificatesClient
      LIST_PROPERTY = 'tls_certificates'.freeze
      PATH = '/tls_certificates'.freeze

      attr_reader :client

      def initialize(client:)
        @client = client
      end

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

      def delete(id: nil)
        @client.delete("#{PATH}/#{id}")
      end

      def get(id: nil)
        result = @client.get("#{PATH}/#{id}")
        NgrokAPI::Models::TlsCertificate.new(client: self, result: result)
      end

      def list(before_id: nil, limit: nil, url: nil)
        result = if url.nil?
          data = {}
          data[:before_id] = before_id if before_id
          data[:limit] = limit if limit
          @client.get(PATH, data: data)
        else
          @client.get(url)
        end
        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::TlsCertificate
        )
      end

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
    end
  end
end
