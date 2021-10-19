# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # Endpoint Configurations are a reusable group of modules that encapsulate how
    #  traffic to a domain or address is handled. Endpoint configurations are only
    #  applied to Domains and TCP Addresses they have been attached to.
    #
    # https://ngrok.com/docs/api#api-endpoint-configurations
    class EndpointConfigurationsClient
      # The API path for the requests
      PATH = '/endpoint_configurations'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'endpoint_configurations'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new endpoint configuration
      #
      # @param [string] type they type of traffic this endpoint configuration can be applied to. one of: ``http``, ``https``, ``tcp``
      # @param [string] description human-readable description of what this endpoint configuration will be do when applied or what traffic it will be applied to. Optional, max 255 bytes
      # @param [string] metadata arbitrary user-defined machine-readable data of this endpoint configuration. Optional, max 4096 bytes.
      # @param [EndpointCircuitBreaker] circuit_breaker circuit breaker module configuration or ``null``
      # @param [EndpointCompression] compression compression module configuration or ``null``
      # @param [EndpointRequestHeaders] request_headers request headers module configuration or ``null``
      # @param [EndpointResponseHeaders] response_headers response headers module configuration or ``null``
      # @param [EndpointIPPolicyMutate] ip_policy ip policy module configuration or ``null``
      # @param [EndpointMutualTLSMutate] mutual_tls mutual TLS module configuration or ``null``
      # @param [EndpointTLSTermination] tls_termination TLS termination module configuration or ``null``
      # @param [EndpointWebhookValidation] webhook_validation webhook validation module configuration or ``null``
      # @param [EndpointOAuth] oauth oauth module configuration or ``null``
      # @param [EndpointLoggingMutate] logging logging module configuration or ``null``
      # @param [EndpointSAMLMutate] saml saml module configuration or ``null``
      # @param [EndpointOIDC] oidc oidc module configuration or ``null``
      # @return [NgrokAPI::Models::EndpointConfiguration] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-create
      def create(
        type: "",
        description: "",
        metadata: "",
        basic_auth: nil,
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
        oidc: nil,
        backend: nil
      )
        path = '/endpoint_configurations'
        replacements = {
        }
        data = {}
        data[:type] = type if type
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
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::EndpointConfiguration.new(client: self, result: result)
      end

      ##
      # Delete an endpoint configuration. This operation will fail if the endpoint
      # configuration is still referenced by any reserved domain or reserved address.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-delete
      def delete(
        id: ""
      )
        path = '/endpoint_configurations/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an endpoint configuration. This operation will fail if the endpoint
      # configuration is still referenced by any reserved domain or reserved address.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-delete
      def delete!(
        id: ""
      )
        path = '/endpoint_configurations/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Returns detailed information about an endpoint configuration
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointConfiguration] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-get
      def get(
        id: ""
      )
        path = '/endpoint_configurations/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointConfiguration.new(client: self, result: result)
      end

      ##
      # Returns detailed information about an endpoint configuration
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointConfiguration] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-get
      def get!(
        id: ""
      )
        path = '/endpoint_configurations/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointConfiguration.new(client: self, result: result)
      end

      ##
      # Returns a list of all endpoint configurations on this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-list
      def list(
        before_id: nil,
        limit: nil,
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::EndpointConfiguration
        )
      end

      ##
      # Returns a list of all endpoint configurations on this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-list
      def list!(
        before_id: nil,
        limit: nil,
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          danger: true,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::EndpointConfiguration,
          danger: true
        )
      end

      ##
      # Updates an endpoint configuration. If a module is not specified in the update,
      # it will not be modified. However, each module configuration that is specified
      # will completely replace the existing value. There is no way to delete an
      # existing module via this API, instead use the delete module API.
      #
      # @param [string] id unique identifier of this endpoint configuration
      # @param [string] description human-readable description of what this endpoint configuration will be do when applied or what traffic it will be applied to. Optional, max 255 bytes
      # @param [string] metadata arbitrary user-defined machine-readable data of this endpoint configuration. Optional, max 4096 bytes.
      # @param [EndpointCircuitBreaker] circuit_breaker circuit breaker module configuration or ``null``
      # @param [EndpointCompression] compression compression module configuration or ``null``
      # @param [EndpointRequestHeaders] request_headers request headers module configuration or ``null``
      # @param [EndpointResponseHeaders] response_headers response headers module configuration or ``null``
      # @param [EndpointIPPolicyMutate] ip_policy ip policy module configuration or ``null``
      # @param [EndpointMutualTLSMutate] mutual_tls mutual TLS module configuration or ``null``
      # @param [EndpointTLSTermination] tls_termination TLS termination module configuration or ``null``
      # @param [EndpointWebhookValidation] webhook_validation webhook validation module configuration or ``null``
      # @param [EndpointOAuth] oauth oauth module configuration or ``null``
      # @param [EndpointLoggingMutate] logging logging module configuration or ``null``
      # @param [EndpointSAMLMutate] saml saml module configuration or ``null``
      # @param [EndpointOIDC] oidc oidc module configuration or ``null``
      # @return [NgrokAPI::Models::EndpointConfiguration] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-update
      def update(
        id: "",
        description: nil,
        metadata: nil,
        basic_auth: nil,
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
        oidc: nil,
        backend: nil
      )
        path = '/endpoint_configurations/%{id}'
        replacements = {
          id: id,
        }
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
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::EndpointConfiguration.new(client: self, result: result)
      end

      ##
      # Updates an endpoint configuration. If a module is not specified in the update,
      # it will not be modified. However, each module configuration that is specified
      # will completely replace the existing value. There is no way to delete an
      # existing module via this API, instead use the delete module API.
      # Throws an exception if API error.
      #
      # @param [string] id unique identifier of this endpoint configuration
      # @param [string] description human-readable description of what this endpoint configuration will be do when applied or what traffic it will be applied to. Optional, max 255 bytes
      # @param [string] metadata arbitrary user-defined machine-readable data of this endpoint configuration. Optional, max 4096 bytes.
      # @param [EndpointCircuitBreaker] circuit_breaker circuit breaker module configuration or ``null``
      # @param [EndpointCompression] compression compression module configuration or ``null``
      # @param [EndpointRequestHeaders] request_headers request headers module configuration or ``null``
      # @param [EndpointResponseHeaders] response_headers response headers module configuration or ``null``
      # @param [EndpointIPPolicyMutate] ip_policy ip policy module configuration or ``null``
      # @param [EndpointMutualTLSMutate] mutual_tls mutual TLS module configuration or ``null``
      # @param [EndpointTLSTermination] tls_termination TLS termination module configuration or ``null``
      # @param [EndpointWebhookValidation] webhook_validation webhook validation module configuration or ``null``
      # @param [EndpointOAuth] oauth oauth module configuration or ``null``
      # @param [EndpointLoggingMutate] logging logging module configuration or ``null``
      # @param [EndpointSAMLMutate] saml saml module configuration or ``null``
      # @param [EndpointOIDC] oidc oidc module configuration or ``null``
      # @return [NgrokAPI::Models::EndpointConfiguration] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-configurations-update
      def update!(
        id: "",
        description: nil,
        metadata: nil,
        basic_auth: nil,
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
        oidc: nil,
        backend: nil
      )
        path = '/endpoint_configurations/%{id}'
        replacements = {
          id: id,
        }
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
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointConfiguration.new(client: self, result: result)
      end
    end
  end
end
