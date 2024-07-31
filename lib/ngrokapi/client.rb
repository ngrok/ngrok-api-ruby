# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'ostruct'

module NgrokAPI
  ##
  # Low-level api client for communicating with Ngrok's HTTP API.
  # Use this object to instantiate your clients.
  class Client
    def initialize(api_key:, base_url: 'https://api.ngrok.com')
      @client = NgrokAPI::HttpClient.new(api_key: api_key, base_url: base_url)
    end

    ##
    # Abuse Reports allow you to submit take-down requests for URLs hosted by
    #  ngrok that violate ngrok's terms of service.
    #
    # @return [NgrokAPI::Services::AbuseReportsClient]
    def abuse_reports
      @_abuse_reports ||= NgrokAPI::Services::AbuseReportsClient.new(client: @client)
    end

    def agent_ingresses
      @_agent_ingresses ||= NgrokAPI::Services::AgentIngressesClient.new(client: @client)
    end

    ##
    # API Keys are used to authenticate to the [ngrok
    #  API](https://ngrok.com/docs/api#authentication). You may use the API itself
    #  to provision and manage API Keys but you'll need to provision your first API
    #  key from the [API Keys page](https://dashboard.ngrok.com/api/keys) on your
    #  ngrok.com dashboard.
    #
    # @return [NgrokAPI::Services::APIKeysClient]
    def api_keys
      @_api_keys ||= NgrokAPI::Services::APIKeysClient.new(client: @client)
    end

    def application_sessions
      @_application_sessions ||= NgrokAPI::Services::ApplicationSessionsClient.new(client: @client)
    end

    def application_users
      @_application_users ||= NgrokAPI::Services::ApplicationUsersClient.new(client: @client)
    end

    ##
    # Tunnel Sessions represent instances of ngrok agents or SSH reverse tunnel
    #  sessions that are running and connected to the ngrok service. Each tunnel
    #  session can include one or more Tunnels.
    #
    # @return [NgrokAPI::Services::TunnelSessionsClient]
    def tunnel_sessions
      @_tunnel_sessions ||= NgrokAPI::Services::TunnelSessionsClient.new(client: @client)
    end

    def bot_users
      @_bot_users ||= NgrokAPI::Services::BotUsersClient.new(client: @client)
    end

    ##
    # Certificate Authorities are x509 certificates that are used to sign other
    #  x509 certificates. Attach a Certificate Authority to the Mutual TLS module
    #  to verify that the TLS certificate presented by a client has been signed by
    #  this CA. Certificate Authorities  are used only for mTLS validation only and
    #  thus a private key is not included in the resource.
    #
    # @return [NgrokAPI::Services::CertificateAuthoritiesClient]
    def certificate_authorities
      @_certificate_authorities ||= NgrokAPI::Services::CertificateAuthoritiesClient.new(client: @client)
    end

    ##
    # Tunnel Credentials are ngrok agent authtokens. They authorize the ngrok
    #  agent to connect the ngrok service as your account. They are installed with
    #  the `ngrok config add-authtoken` command or by specifying it in the `ngrok.yml`
    #  configuration file with the `authtoken` property.
    #
    # @return [NgrokAPI::Services::CredentialsClient]
    def credentials
      @_credentials ||= NgrokAPI::Services::CredentialsClient.new(client: @client)
    end

    ##
    # Endpoints provides an API for querying the endpoint objects
    #  which define what tunnel or edge is used to serve a hostport.
    #  Only active endpoints associated with a tunnel or backend are returned.
    #
    # @return [NgrokAPI::Services::EndpointsClient]
    def endpoints
      @_endpoints ||= NgrokAPI::Services::EndpointsClient.new(client: @client)
    end

    def event_destinations
      @_event_destinations ||= NgrokAPI::Services::EventDestinationsClient.new(client: @client)
    end

    def event_subscriptions
      @_event_subscriptions ||= NgrokAPI::Services::EventSubscriptionsClient.new(client: @client)
    end

    def event_sources
      @_event_sources ||= NgrokAPI::Services::EventSourcesClient.new(client: @client)
    end

    ##
    # IP Policies are reusable groups of CIDR ranges with an `allow` or `deny`
    #  action. They can be attached to endpoints via the Endpoint Configuration IP
    #  Policy module. They can also be used with IP Restrictions to control source
    #  IP ranges that can start tunnel sessions and connect to the API and dashboard.
    #
    # @return [NgrokAPI::Services::IPPoliciesClient]
    def ip_policies
      @_ip_policies ||= NgrokAPI::Services::IPPoliciesClient.new(client: @client)
    end

    ##
    # IP Policy Rules are the IPv4 or IPv6 CIDRs entries that
    #  make up an IP Policy.
    #
    # @return [NgrokAPI::Services::IPPolicyRulesClient]
    def ip_policy_rules
      @_ip_policy_rules ||= NgrokAPI::Services::IPPolicyRulesClient.new(client: @client)
    end

    ##
    # An IP restriction is a restriction placed on the CIDRs that are allowed to
    #  initiate traffic to a specific aspect of your ngrok account. An IP
    #  restriction has a type which defines the ingress it applies to. IP
    #  restrictions can be used to enforce the source IPs that can make API
    #  requests, log in to the dashboard, start ngrok agents, and connect to your
    #  public-facing endpoints.
    #
    # @return [NgrokAPI::Services::IPRestrictionsClient]
    def ip_restrictions
      @_ip_restrictions ||= NgrokAPI::Services::IPRestrictionsClient.new(client: @client)
    end

    ##
    # Reserved Addresses are TCP addresses that can be used to listen for traffic.
    #  TCP address hostnames and ports are assigned by ngrok, they cannot be
    #  chosen.
    #
    # @return [NgrokAPI::Services::ReservedAddrsClient]
    def reserved_addrs
      @_reserved_addrs ||= NgrokAPI::Services::ReservedAddrsClient.new(client: @client)
    end

    ##
    # Reserved Domains are hostnames that you can listen for traffic on. Domains
    #  can be used to listen for http, https or tls traffic. You may use a domain
    #  that you own by creating a CNAME record specified in the returned resource.
    #  This CNAME record points traffic for that domain to ngrok's edge servers.
    #
    # @return [NgrokAPI::Services::ReservedDomainsClient]
    def reserved_domains
      @_reserved_domains ||= NgrokAPI::Services::ReservedDomainsClient.new(client: @client)
    end

    ##
    # An SSH Certificate Authority is a pair of an SSH Certificate and its private
    #  key that can be used to sign other SSH host and user certificates.
    #
    # @return [NgrokAPI::Services::SSHCertificateAuthoritiesClient]
    def ssh_certificate_authorities
      @_ssh_certificate_authorities ||= NgrokAPI::Services::SSHCertificateAuthoritiesClient.new(client: @client)
    end

    ##
    # SSH Credentials are SSH public keys that can be used to start SSH tunnels
    #  via the ngrok SSH tunnel gateway.
    #
    # @return [NgrokAPI::Services::SSHCredentialsClient]
    def ssh_credentials
      @_ssh_credentials ||= NgrokAPI::Services::SSHCredentialsClient.new(client: @client)
    end

    ##
    # SSH Host Certificates along with the corresponding private key allows an SSH
    #  server to assert its authenticity to connecting SSH clients who trust the
    #  SSH Certificate Authority that was used to sign the certificate.
    #
    # @return [NgrokAPI::Services::SSHHostCertificatesClient]
    def ssh_host_certificates
      @_ssh_host_certificates ||= NgrokAPI::Services::SSHHostCertificatesClient.new(client: @client)
    end

    ##
    # SSH User Certificates are presented by SSH clients when connecting to an SSH
    #  server to authenticate their connection. The SSH server must trust the SSH
    #  Certificate Authority used to sign the certificate.
    #
    # @return [NgrokAPI::Services::SSHUserCertificatesClient]
    def ssh_user_certificates
      @_ssh_user_certificates ||= NgrokAPI::Services::SSHUserCertificatesClient.new(client: @client)
    end

    ##
    # TLS Certificates are pairs of x509 certificates and their matching private
    #  key that can be used to terminate TLS traffic. TLS certificates are unused
    #  until they are attached to a Domain. TLS Certificates may also be
    #  provisioned by ngrok automatically for domains on which you have enabled
    #  automated certificate provisioning.
    #
    # @return [NgrokAPI::Services::TLSCertificatesClient]
    def tls_certificates
      @_tls_certificates ||= NgrokAPI::Services::TLSCertificatesClient.new(client: @client)
    end

    ##
    # Tunnels provide endpoints to access services exposed by a running ngrok
    #  agent tunnel session or an SSH reverse tunnel session.
    #
    # @return [NgrokAPI::Services::TunnelsClient]
    def tunnels
      @_tunnels ||= NgrokAPI::Services::TunnelsClient.new(client: @client)
    end

    def backends
      ns = OpenStruct.new
      ns.failover = NgrokAPI::Services::FailoverBackendsClient.new(client: @client)
      ns.http_response = NgrokAPI::Services::HTTPResponseBackendsClient.new(client: @client)
      ns.static_address = NgrokAPI::Services::StaticBackendsClient.new(client: @client)
      ns.tunnel_group = NgrokAPI::Services::TunnelGroupBackendsClient.new(client: @client)
      ns.weighted = NgrokAPI::Services::WeightedBackendsClient.new(client: @client)

      ns
    end

    def edges
      ns = OpenStruct.new
      ns.https_routes = NgrokAPI::Services::EdgesHTTPSRoutesClient.new(client: @client)
      ns.https = NgrokAPI::Services::EdgesHTTPSClient.new(client: @client)
      ns.tcp = NgrokAPI::Services::EdgesTCPClient.new(client: @client)
      ns.tls = NgrokAPI::Services::EdgesTLSClient.new(client: @client)

      ns
    end

    def edge_modules
      ns = OpenStruct.new
      ns.https_edge_mutual_tls = NgrokAPI::Services::HTTPSEdgeMutualTLSModuleClient.new(client: @client)
      ns.https_edge_tls_termination = NgrokAPI::Services::HTTPSEdgeTLSTerminationModuleClient.new(client: @client)
      ns.https_edge_route_backend = NgrokAPI::Services::EdgeRouteBackendModuleClient.new(client: @client)
      ns.https_edge_route_ip_restriction = NgrokAPI::Services::EdgeRouteIPRestrictionModuleClient.new(client: @client)
      ns.https_edge_route_request_headers = NgrokAPI::Services::EdgeRouteRequestHeadersModuleClient.new(client: @client)
      ns.https_edge_route_response_headers = NgrokAPI::Services::EdgeRouteResponseHeadersModuleClient.new(client: @client)
      ns.https_edge_route_compression = NgrokAPI::Services::EdgeRouteCompressionModuleClient.new(client: @client)
      ns.https_edge_route_circuit_breaker = NgrokAPI::Services::EdgeRouteCircuitBreakerModuleClient.new(client: @client)
      ns.https_edge_route_webhook_verification = NgrokAPI::Services::EdgeRouteWebhookVerificationModuleClient.new(client: @client)
      ns.https_edge_route_oauth = NgrokAPI::Services::EdgeRouteOAuthModuleClient.new(client: @client)
      ns.https_edge_route_saml = NgrokAPI::Services::EdgeRouteSAMLModuleClient.new(client: @client)
      ns.https_edge_route_oidc = NgrokAPI::Services::EdgeRouteOIDCModuleClient.new(client: @client)
      ns.https_edge_route_websocket_tcp_converter = NgrokAPI::Services::EdgeRouteWebsocketTCPConverterModuleClient.new(client: @client)
      ns.https_edge_route_user_agent_filter = NgrokAPI::Services::EdgeRouteUserAgentFilterModuleClient.new(client: @client)
      ns.https_edge_route_traffic_policy = NgrokAPI::Services::EdgeRouteTrafficPolicyModuleClient.new(client: @client)
      ns.tcp_edge_backend = NgrokAPI::Services::TCPEdgeBackendModuleClient.new(client: @client)
      ns.tcp_edge_ip_restriction = NgrokAPI::Services::TCPEdgeIPRestrictionModuleClient.new(client: @client)
      ns.tcp_edge_traffic_policy = NgrokAPI::Services::TCPEdgeTrafficPolicyModuleClient.new(client: @client)
      ns.tls_edge_backend = NgrokAPI::Services::TLSEdgeBackendModuleClient.new(client: @client)
      ns.tls_edge_ip_restriction = NgrokAPI::Services::TLSEdgeIPRestrictionModuleClient.new(client: @client)
      ns.tls_edge_mutual_tls = NgrokAPI::Services::TLSEdgeMutualTLSModuleClient.new(client: @client)
      ns.tls_edge_tls_termination = NgrokAPI::Services::TLSEdgeTLSTerminationModuleClient.new(client: @client)
      ns.tls_edge_traffic_policy = NgrokAPI::Services::TLSEdgeTrafficPolicyModuleClient.new(client: @client)

      ns
    end
  end
end
