# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-edges-https-routes
    class EdgesHTTPSRoutesClient
      # The API path for the requests
      PATH = '/edges/https/%{edge_id}/routes'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create an HTTPS Edge Route
      #
      # @param [string] edge_id unique identifier of this edge
      # @param [string] match_type Type of match to use for this route. Valid values are "exact_path" and "path_prefix".
      # @param [string] match Route selector: "/blog" or "example.com" or "example.com/blog"
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge. Optional, max 4096 bytes.
      # @param [EndpointBackendMutate] backend backend module configuration or ``null``
      # @param [EndpointIPPolicyMutate] ip_restriction ip restriction module configuration or ``null``
      # @param [EndpointCircuitBreaker] circuit_breaker circuit breaker module configuration or ``null``
      # @param [EndpointCompression] compression compression module configuration or ``null``
      # @param [EndpointRequestHeaders] request_headers request headers module configuration or ``null``
      # @param [EndpointResponseHeaders] response_headers response headers module configuration or ``null``
      # @param [EndpointWebhookValidation] webhook_verification webhook verification module configuration or ``null``
      # @param [EndpointOAuth] oauth oauth module configuration or ``null``
      # @param [EndpointSAMLMutate] saml saml module configuration or ``null``
      # @param [EndpointOIDC] oidc oidc module configuration or ``null``
      # @param [EndpointWebsocketTCPConverter] websocket_tcp_converter websocket to tcp adapter configuration or ``null``
      # @param [EndpointUserAgentFilter] user_agent_filter
      # @param [EndpointTrafficPolicy] traffic_policy the traffic policy associated with this edge or null
      # @return [NgrokAPI::Models::HTTPSEdgeRoute] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-routes-create
      def create(edge_id: "", match_type:, match:, description: "", metadata: "", backend: nil, ip_restriction: nil, circuit_breaker: nil, compression: nil, request_headers: nil, response_headers: nil, webhook_verification: nil, oauth: nil, saml: nil, oidc: nil, websocket_tcp_converter: nil, user_agent_filter: nil, policy: nil, traffic_policy: nil)
        path = '/edges/https/%{edge_id}/routes'
        replacements = {
          edge_id: edge_id,
        }
        data = {}
        data[:match_type] = match_type if match_type
        data[:match] = match if match
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:backend] = backend if backend
        data[:ip_restriction] = ip_restriction if ip_restriction
        data[:circuit_breaker] = circuit_breaker if circuit_breaker
        data[:compression] = compression if compression
        data[:request_headers] = request_headers if request_headers
        data[:response_headers] = response_headers if response_headers
        data[:webhook_verification] = webhook_verification if webhook_verification
        data[:oauth] = oauth if oauth
        data[:saml] = saml if saml
        data[:oidc] = oidc if oidc
        data[:websocket_tcp_converter] = websocket_tcp_converter if websocket_tcp_converter
        data[:user_agent_filter] = user_agent_filter if user_agent_filter
        data[:traffic_policy] = traffic_policy if traffic_policy
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::HTTPSEdgeRoute.new(client: self, attrs: result)
      end

      ##
      # Create an HTTPS Edge Route
      # Throws an exception if API error.
      #
      # @param [string] edge_id unique identifier of this edge
      # @param [string] match_type Type of match to use for this route. Valid values are "exact_path" and "path_prefix".
      # @param [string] match Route selector: "/blog" or "example.com" or "example.com/blog"
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge. Optional, max 4096 bytes.
      # @param [EndpointBackendMutate] backend backend module configuration or ``null``
      # @param [EndpointIPPolicyMutate] ip_restriction ip restriction module configuration or ``null``
      # @param [EndpointCircuitBreaker] circuit_breaker circuit breaker module configuration or ``null``
      # @param [EndpointCompression] compression compression module configuration or ``null``
      # @param [EndpointRequestHeaders] request_headers request headers module configuration or ``null``
      # @param [EndpointResponseHeaders] response_headers response headers module configuration or ``null``
      # @param [EndpointWebhookValidation] webhook_verification webhook verification module configuration or ``null``
      # @param [EndpointOAuth] oauth oauth module configuration or ``null``
      # @param [EndpointSAMLMutate] saml saml module configuration or ``null``
      # @param [EndpointOIDC] oidc oidc module configuration or ``null``
      # @param [EndpointWebsocketTCPConverter] websocket_tcp_converter websocket to tcp adapter configuration or ``null``
      # @param [EndpointUserAgentFilter] user_agent_filter
      # @param [EndpointTrafficPolicy] traffic_policy the traffic policy associated with this edge or null
      # @return [NgrokAPI::Models::HTTPSEdgeRoute] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-routes-create
      def create!(edge_id: "", match_type:, match:, description: "", metadata: "", backend: nil, ip_restriction: nil, circuit_breaker: nil, compression: nil, request_headers: nil, response_headers: nil, webhook_verification: nil, oauth: nil, saml: nil, oidc: nil, websocket_tcp_converter: nil, user_agent_filter: nil, policy: nil, traffic_policy: nil)
        path = '/edges/https/%{edge_id}/routes'
        replacements = {
          edge_id: edge_id,
        }
        data = {}
        data[:match_type] = match_type if match_type
        data[:match] = match if match
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:backend] = backend if backend
        data[:ip_restriction] = ip_restriction if ip_restriction
        data[:circuit_breaker] = circuit_breaker if circuit_breaker
        data[:compression] = compression if compression
        data[:request_headers] = request_headers if request_headers
        data[:response_headers] = response_headers if response_headers
        data[:webhook_verification] = webhook_verification if webhook_verification
        data[:oauth] = oauth if oauth
        data[:saml] = saml if saml
        data[:oidc] = oidc if oidc
        data[:websocket_tcp_converter] = websocket_tcp_converter if websocket_tcp_converter
        data[:user_agent_filter] = user_agent_filter if user_agent_filter
        data[:traffic_policy] = traffic_policy if traffic_policy
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::HTTPSEdgeRoute.new(client: self, attrs: result)
      end

      ##
      # Get an HTTPS Edge Route by ID
      #
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::HTTPSEdgeRoute] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-routes-get
      def get(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::HTTPSEdgeRoute.new(client: self, attrs: result)
      end

      ##
      # Get an HTTPS Edge Route by ID
      # Throws an exception if API error.
      #
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::HTTPSEdgeRoute] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-routes-get
      def get!(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::HTTPSEdgeRoute.new(client: self, attrs: result)
      end

      ##
      # Updates an HTTPS Edge Route by ID. If a module is not specified in the update,
      # it will not be modified. However, each module configuration that is specified
      # will completely replace the existing value. There is no way to delete an
      # existing module via this API, instead use the delete module API.
      #
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @param [string] match_type Type of match to use for this route. Valid values are "exact_path" and "path_prefix".
      # @param [string] match Route selector: "/blog" or "example.com" or "example.com/blog"
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge. Optional, max 4096 bytes.
      # @param [EndpointBackendMutate] backend backend module configuration or ``null``
      # @param [EndpointIPPolicyMutate] ip_restriction ip restriction module configuration or ``null``
      # @param [EndpointCircuitBreaker] circuit_breaker circuit breaker module configuration or ``null``
      # @param [EndpointCompression] compression compression module configuration or ``null``
      # @param [EndpointRequestHeaders] request_headers request headers module configuration or ``null``
      # @param [EndpointResponseHeaders] response_headers response headers module configuration or ``null``
      # @param [EndpointWebhookValidation] webhook_verification webhook verification module configuration or ``null``
      # @param [EndpointOAuth] oauth oauth module configuration or ``null``
      # @param [EndpointSAMLMutate] saml saml module configuration or ``null``
      # @param [EndpointOIDC] oidc oidc module configuration or ``null``
      # @param [EndpointWebsocketTCPConverter] websocket_tcp_converter websocket to tcp adapter configuration or ``null``
      # @param [EndpointUserAgentFilter] user_agent_filter
      # @param [EndpointTrafficPolicy] traffic_policy the traffic policy associated with this edge or null
      # @return [NgrokAPI::Models::HTTPSEdgeRoute] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-routes-update
      def update(edge_id: "", id: "", match_type: "", match: "", description: "", metadata: "", backend: nil, ip_restriction: nil, circuit_breaker: nil, compression: nil, request_headers: nil, response_headers: nil, webhook_verification: nil, oauth: nil, saml: nil, oidc: nil, websocket_tcp_converter: nil, user_agent_filter: nil, policy: nil, traffic_policy: nil)
        path = '/edges/https/%{edge_id}/routes/%{id}'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        data[:match_type] = match_type if match_type
        data[:match] = match if match
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:backend] = backend if backend
        data[:ip_restriction] = ip_restriction if ip_restriction
        data[:circuit_breaker] = circuit_breaker if circuit_breaker
        data[:compression] = compression if compression
        data[:request_headers] = request_headers if request_headers
        data[:response_headers] = response_headers if response_headers
        data[:webhook_verification] = webhook_verification if webhook_verification
        data[:oauth] = oauth if oauth
        data[:saml] = saml if saml
        data[:oidc] = oidc if oidc
        data[:websocket_tcp_converter] = websocket_tcp_converter if websocket_tcp_converter
        data[:user_agent_filter] = user_agent_filter if user_agent_filter
        data[:traffic_policy] = traffic_policy if traffic_policy
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::HTTPSEdgeRoute.new(client: self, attrs: result)
      end

      ##
      # Updates an HTTPS Edge Route by ID. If a module is not specified in the update,
      # it will not be modified. However, each module configuration that is specified
      # will completely replace the existing value. There is no way to delete an
      # existing module via this API, instead use the delete module API.
      # Throws an exception if API error.
      #
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @param [string] match_type Type of match to use for this route. Valid values are "exact_path" and "path_prefix".
      # @param [string] match Route selector: "/blog" or "example.com" or "example.com/blog"
      # @param [string] description human-readable description of what this edge will be used for; optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this edge. Optional, max 4096 bytes.
      # @param [EndpointBackendMutate] backend backend module configuration or ``null``
      # @param [EndpointIPPolicyMutate] ip_restriction ip restriction module configuration or ``null``
      # @param [EndpointCircuitBreaker] circuit_breaker circuit breaker module configuration or ``null``
      # @param [EndpointCompression] compression compression module configuration or ``null``
      # @param [EndpointRequestHeaders] request_headers request headers module configuration or ``null``
      # @param [EndpointResponseHeaders] response_headers response headers module configuration or ``null``
      # @param [EndpointWebhookValidation] webhook_verification webhook verification module configuration or ``null``
      # @param [EndpointOAuth] oauth oauth module configuration or ``null``
      # @param [EndpointSAMLMutate] saml saml module configuration or ``null``
      # @param [EndpointOIDC] oidc oidc module configuration or ``null``
      # @param [EndpointWebsocketTCPConverter] websocket_tcp_converter websocket to tcp adapter configuration or ``null``
      # @param [EndpointUserAgentFilter] user_agent_filter
      # @param [EndpointTrafficPolicy] traffic_policy the traffic policy associated with this edge or null
      # @return [NgrokAPI::Models::HTTPSEdgeRoute] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-routes-update
      def update!(edge_id: "", id: "", match_type: "", match: "", description: "", metadata: "", backend: nil, ip_restriction: nil, circuit_breaker: nil, compression: nil, request_headers: nil, response_headers: nil, webhook_verification: nil, oauth: nil, saml: nil, oidc: nil, websocket_tcp_converter: nil, user_agent_filter: nil, policy: nil, traffic_policy: nil)
        path = '/edges/https/%{edge_id}/routes/%{id}'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        data = {}
        data[:match_type] = match_type if match_type
        data[:match] = match if match
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:backend] = backend if backend
        data[:ip_restriction] = ip_restriction if ip_restriction
        data[:circuit_breaker] = circuit_breaker if circuit_breaker
        data[:compression] = compression if compression
        data[:request_headers] = request_headers if request_headers
        data[:response_headers] = response_headers if response_headers
        data[:webhook_verification] = webhook_verification if webhook_verification
        data[:oauth] = oauth if oauth
        data[:saml] = saml if saml
        data[:oidc] = oidc if oidc
        data[:websocket_tcp_converter] = websocket_tcp_converter if websocket_tcp_converter
        data[:user_agent_filter] = user_agent_filter if user_agent_filter
        data[:traffic_policy] = traffic_policy if traffic_policy
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::HTTPSEdgeRoute.new(client: self, attrs: result)
      end

      ##
      # Delete an HTTPS Edge Route by ID
      #
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-routes-delete
      def delete(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an HTTPS Edge Route by ID
      # Throws an exception if API error.
      #
      # @param [string] edge_id unique identifier of this edge
      # @param [string] id unique identifier of this edge route
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-edges-https-routes-delete
      def delete!(edge_id: "", id: "")
        path = '/edges/https/%{edge_id}/routes/%{id}'
        replacements = {
          edge_id: edge_id,
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
