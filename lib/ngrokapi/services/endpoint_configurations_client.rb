# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # A client for interacting with the endpoint_configuration API
    #
    # https://ngrok.com/docs/api#api-endpoint-configurations
    class EndpointConfigurationsClient
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'endpoint_configurations'.freeze
      # The API path for endpoint configurations
      PATH = '/endpoint_configurations'.freeze

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new endpoint configuration
      #
      # @param [string] description human-readable description of what this endpoint configuration will be do when applied or what traffic it will be applied to. Optional, max 255 bytes
      # @param [string] metadata arbitrary user-defined machine-readable data of this endpoint configuration. Optional, max 4096 bytes.
      # @param [string] type they type of traffic this endpoint configuration can be applied to. one of: ``http``, ``https``, ``tcp``
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
      # @return [NgrokAPI::Models::EndpointConfiguration] result from create request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-create
      def create(
        description: '',
        metadata: '',
        type: '',
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
        data = {
          type: type,
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
          oidc: oidc,
        }
        result = @client.post(PATH, data: data)
        NgrokAPI::Models::EndpointConfiguration.new(client: self, result: result)
      end

      ##
      # Delete an endpoint configuration. This operation will fail if the endpoint configuration is still referenced by any reserved domain or reserved address.
      #
      # @param [string] id a resource identifier
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-delete
      def delete(id: nil)
        @client.delete("#{PATH}/#{id}")
      end

      ##
      # Returns detailed information about an endpoint configuration by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointConfiguration] result from get request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-get
      def get(id: nil)
        result = @client.get("#{PATH}/#{id}")
        NgrokAPI::Models::EndpointConfiguration.new(client: self, result: result)
      end

      ##
      # Returns a list of all endpoint configurations on this account.
      #
      # @param [string] before_id
      # @param [integer] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] the result listable
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-list
      def list(before_id: nil, limit: nil, url: nil)
        result = @client.list(before_id: before_id, limit: limit, url: url, path: PATH)
        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::EndpointConfiguration
        )
      end

      ##
      # Updates an endpoint configuration. If a module is not specified in the update, it will not be modified.
      # However, each module configuration that is specified will completely replace the existing value.
      # There is no way to delete an existing module via this API, instead use the delete module API.
      #
      # @param [string] id unique identifier of this endpoint configuration
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
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-update
      def update(
        id: nil,
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
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:circuit_breaker] = circuit_breaker if circuit_breaker
        data[:compression] = compression if compression
        data[:request_headers] = request_headers if request_headers
        data[:response_headers] = response_headers if response_headers
        data[:ip_policy] = ip_policy if ip_policy
        data[:mutual_tls] = mutual_tls if mutual_tls
        data[:tls_termination] = tls_termination if tls_termination
        data[:webhook_validation] = webhook_validation if webhook_validation
        data[:oauth] = oauth if oauth
        data[:logging] = logging if logging
        data[:saml] = saml if saml
        data[:oidc] = oidc if oidc
        result = @client.patch("#{PATH}/#{id}", data: data)
        NgrokAPI::Models::EndpointConfiguration.new(client: self, result: result)
      end
    end
  end
end
