# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointConfiguration
      attr_reader :client,
        :result,
        :id,
        :type,
        :description,
        :metadata,
        :created_at,
        :uri,
        :basic_auth,
        :circuit_breaker,
        :compression,
        :request_headers,
        :response_headers,
        :ip_policy,
        :mutual_tls,
        :tls_termination,
        :webhook_validation,
        :oauth,
        :logging,
        :saml,
        :oidc,
        :backend

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @type = @result['type']
        @description = @result['description']
        @metadata = @result['metadata']
        @created_at = @result['created_at']
        @uri = @result['uri']
        @basic_auth = @result['basic_auth']
        @circuit_breaker = @result['circuit_breaker']
        @compression = @result['compression']
        @request_headers = @result['request_headers']
        @response_headers = @result['response_headers']
        @ip_policy = @result['ip_policy']
        @mutual_tls = @result['mutual_tls']
        @tls_termination = @result['tls_termination']
        @webhook_validation = @result['webhook_validation']
        @oauth = @result['oauth']
        @logging = @result['logging']
        @saml = @result['saml']
        @oidc = @result['oidc']
        @backend = @result['backend']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete an endpoint configuration. This operation will fail if the endpoint
      # configuration is still referenced by any reserved domain or reserved address.
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Updates an endpoint configuration. If a module is not specified in the update,
      # it will not be modified. However, each module configuration that is specified
      # will completely replace the existing value. There is no way to delete an
      # existing module via this API, instead use the delete module API.
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-update
      def update(
        description: nil,
        metadata: nil,
        circuit_breaker: nil,
        compression: nil,
        request_headers: nil,
        response_headers: nil,
        ip_policy: nil,
        mutual_tls: nil,
        tls_termination: nil,
        webhook_validation: nil,
        oauth: nil,
        logging: nil,
        saml: nil,
        oidc: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @circuit_breaker = circuit_breaker if circuit_breaker
        @compression = compression if compression
        @request_headers = request_headers if request_headers
        @response_headers = response_headers if response_headers
        @ip_policy = ip_policy if ip_policy
        @mutual_tls = mutual_tls if mutual_tls
        @tls_termination = tls_termination if tls_termination
        @webhook_validation = webhook_validation if webhook_validation
        @oauth = oauth if oauth
        @logging = logging if logging
        @saml = saml if saml
        @oidc = oidc if oidc
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          circuit_breaker: circuit_breaker,
          compression: compression,
          request_headers: request_headers,
          response_headers: response_headers,
          ip_policy: ip_policy,
          mutual_tls: mutual_tls,
          tls_termination: tls_termination,
          webhook_validation: webhook_validation,
          oauth: oauth,
          logging: logging,
          saml: saml,
          oidc: oidc
        )
      end
    end
  end
end
