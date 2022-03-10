# frozen_string_literal: true

module NgrokAPI
  module Models
    class TLSEdge
      attr_reader :client,
        :result,
        :id,
        :description,
        :metadata,
        :created_at,
        :uri,
        :hostports,
        :backend,
        :ip_restriction,
        :mutual_tls,
        :tls_termination

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @description = @result['description']
        @metadata = @result['metadata']
        @created_at = @result['created_at']
        @uri = @result['uri']
        @hostports = @result['hostports']
        @backend = @result['backend']
        @ip_restriction = @result['ip_restriction']
        @mutual_tls = @result['mutual_tls']
        @tls_termination = @result['tls_termination']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Updates a TLS Edge by ID. If a module is not specified in the update, it will
      # not be modified. However, each module configuration that is specified will
      # completely replace the existing value. There is no way to delete an existing
      # module via this API, instead use the delete module API.
      #
      # https://ngrok.com/docs/api#api-edges-tls-update
      def update(
        description: nil,
        metadata: nil,
        hostports: nil,
        backend: nil,
        ip_restriction: nil,
        mutual_tls: nil,
        tls_termination: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @hostports = hostports if hostports
        @backend = backend if backend
        @ip_restriction = ip_restriction if ip_restriction
        @mutual_tls = mutual_tls if mutual_tls
        @tls_termination = tls_termination if tls_termination
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          hostports: hostports,
          backend: backend,
          ip_restriction: ip_restriction,
          mutual_tls: mutual_tls,
          tls_termination: tls_termination
        )
      end

      ##
      # Delete a TLS Edge by ID
      #
      # https://ngrok.com/docs/api#api-edges-tls-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
