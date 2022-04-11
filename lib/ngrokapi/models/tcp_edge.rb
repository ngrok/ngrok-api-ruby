# frozen_string_literal: true

module NgrokAPI
  module Models
    class TCPEdge
      attr_reader :client,
        :attrs,
        :id,
        :description,
        :metadata,
        :created_at,
        :uri,
        :hostports,
        :backend,
        :ip_restriction

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @created_at = @attrs['created_at']
        @uri = @attrs['uri']
        @hostports = @attrs['hostports']
        @backend = @attrs['backend']
        @ip_restriction = @attrs['ip_restriction']
      end

      def ==(other)
        @attrs == other.attrs
      end

      def to_s
        @attrs.to_s
      end

      def to_h
        @attrs.to_h
      end

      ##
      # Updates a TCP Edge by ID. If a module is not specified in the update, it will
      # not be modified. However, each module configuration that is specified will
      # completely replace the existing value. There is no way to delete an existing
      # module via this API, instead use the delete module API.
      #
      # https://ngrok.com/docs/api#api-edges-tcp-update
      def update(
        description: nil,
        metadata: nil,
        hostports: nil,
        backend: nil,
        ip_restriction: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @hostports = hostports if hostports
        @backend = backend if backend
        @ip_restriction = ip_restriction if ip_restriction
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          hostports: hostports,
          backend: backend,
          ip_restriction: ip_restriction
        )
      end

      ##
      # Delete a TCP Edge by ID
      #
      # https://ngrok.com/docs/api#api-edges-tcp-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
