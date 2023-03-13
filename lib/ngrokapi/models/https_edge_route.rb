# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class HTTPSEdgeRoute
      attr_reader :client,
        :attrs,
        :edge_id,
        :id,
        :created_at,
        :match_type,
        :match,
        :uri,
        :description,
        :metadata,
        :backend,
        :ip_restriction,
        :circuit_breaker,
        :compression,
        :request_headers,
        :response_headers,
        :webhook_verification,
        :oauth,
        :saml,
        :oidc,
        :websocket_tcp_converter

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @edge_id = @attrs['edge_id']
        @id = @attrs['id']
        @created_at = @attrs['created_at']
        @match_type = @attrs['match_type']
        @match = @attrs['match']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @backend = @attrs['backend']
        @ip_restriction = @attrs['ip_restriction']
        @circuit_breaker = @attrs['circuit_breaker']
        @compression = @attrs['compression']
        @request_headers = @attrs['request_headers']
        @response_headers = @attrs['response_headers']
        @webhook_verification = @attrs['webhook_verification']
        @oauth = @attrs['oauth']
        @saml = @attrs['saml']
        @oidc = @attrs['oidc']
        @websocket_tcp_converter = @attrs['websocket_tcp_converter']
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
      # Updates an HTTPS Edge Route by ID. If a module is not specified in the update,
      # it will not be modified. However, each module configuration that is specified
      # will completely replace the existing value. There is no way to delete an
      # existing module via this API, instead use the delete module API.
      #
      # https://ngrok.com/docs/api#api-edges-https-routes-update
      def update(
        match_type: "",
        match: "",
        description: "",
        metadata: "",
        backend: nil,
        ip_restriction: nil,
        circuit_breaker: nil,
        compression: nil,
        request_headers: nil,
        response_headers: nil,
        webhook_verification: nil,
        oauth: nil,
        saml: nil,
        oidc: nil,
        websocket_tcp_converter: nil
      )
        @match_type = match_type if match_type
        @match = match if match
        @description = description if description
        @metadata = metadata if metadata
        @backend = backend if backend
        @ip_restriction = ip_restriction if ip_restriction
        @circuit_breaker = circuit_breaker if circuit_breaker
        @compression = compression if compression
        @request_headers = request_headers if request_headers
        @response_headers = response_headers if response_headers
        @webhook_verification = webhook_verification if webhook_verification
        @oauth = oauth if oauth
        @saml = saml if saml
        @oidc = oidc if oidc
        @websocket_tcp_converter = websocket_tcp_converter if websocket_tcp_converter
        @client.update(
          edge_id: @edge_id,
          id: @id,
          match_type: match_type,
          match: match,
          description: description,
          metadata: metadata,
          backend: backend,
          ip_restriction: ip_restriction,
          circuit_breaker: circuit_breaker,
          compression: compression,
          request_headers: request_headers,
          response_headers: response_headers,
          webhook_verification: webhook_verification,
          oauth: oauth,
          saml: saml,
          oidc: oidc,
          websocket_tcp_converter: websocket_tcp_converter
        )
      end

      ##
      # Delete an HTTPS Edge Route by ID
      #
      # https://ngrok.com/docs/api#api-edges-https-routes-delete
      def delete(
      )
        @client.delete(
          edge_id: @edge_id,
          id: @id
        )
      end
    end
  end
end
