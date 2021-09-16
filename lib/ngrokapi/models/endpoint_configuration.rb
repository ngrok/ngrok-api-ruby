# frozen_string_literal: true

module NgrokAPI
  module Models
    ##
    # A resource representing data from the endpoint_configuration API
    class EndpointConfiguration
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

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete this endpoint configuration.
      #
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-delete
      def delete
        @client.delete(id: @id)
      end

      ##
      # rubocop:disable LineLength
      # Update this endpoint configuration. If a module is not specified in the update, it will not be modified.
      # However, each module configuration that is specified will completely replace the existing value.
      # There is no way to delete an existing module via this API, instead use the delete module API.
      #
      # @param [string] description human-readable description of what this endpoint configuration will be do when applied or what traffic it will be applied to. Optional, max 255 bytes
      # @param [string] metadata arbitrary user-defined machine-readable data of this endpoint configuration. Optional, max 4096 bytes.
      # @param [string] circuit_breaker circuit breaker module configuration
      # @param [string] compression compression module configuration
      # @param [string] request_headers request headers module configuration
      # @param [string] response_headers response headers module configuration
      # @param [string] ip_policy ip policy module configuration
      # @param [string] mutual_tls mutual TLS module configuration
      # @param [string] tls_termination TLS termination module configuration
      # @param [string] webhook_validation webhook validation module configuration
      # @param [string] oauth oauth module configuration
      # @param [string] logging logging module configuration
      # @param [string] saml saml module configuration
      # @param [string] oidc oidc module configuration
      # @return [NgrokAPI::Models::EndpointConfiguration] result from update request
      # rubocop:enable LineLength
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
