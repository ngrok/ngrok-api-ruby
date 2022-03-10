# frozen_string_literal: true

module NgrokAPI
  module Models
    class HTTPSEdge
      attr_reader :client,
        :result,
        :id,
        :description,
        :metadata,
        :created_at,
        :uri,
        :hostports,
        :mutual_tls,
        :tls_termination,
        :routes

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @description = @result['description']
        @metadata = @result['metadata']
        @created_at = @result['created_at']
        @uri = @result['uri']
        @hostports = @result['hostports']
        @mutual_tls = @result['mutual_tls']
        @tls_termination = @result['tls_termination']
        @routes = @result['routes']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Updates an HTTPS Edge by ID. If a module is not specified in the update, it will
      # not be modified. However, each module configuration that is specified will
      # completely replace the existing value. There is no way to delete an existing
      # module via this API, instead use the delete module API.
      #
      # https://ngrok.com/docs/api#api-edges-https-update
      def update(
        description: nil,
        metadata: nil,
        hostports: nil,
        mutual_tls: nil,
        tls_termination: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @hostports = hostports if hostports
        @mutual_tls = mutual_tls if mutual_tls
        @tls_termination = tls_termination if tls_termination
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          hostports: hostports,
          mutual_tls: mutual_tls,
          tls_termination: tls_termination
        )
      end

      ##
      # Delete an HTTPS Edge by ID
      #
      # https://ngrok.com/docs/api#api-edges-https-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
