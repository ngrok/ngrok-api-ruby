# frozen_string_literal: true

module NgrokAPI
  ##
  # Low-level api client for communicating with Ngrok's HTTP API.
  # Use this object to instantiate your clients.
  class Client
    def initialize(
      api_key:,
      base_url: 'https://api.ngrok.com'
    )
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

    ##
    # API Keys are used to authenticate to the
    # (https://ngrok.com/docs/api#authentication)ngrok
    #  API. You may use the API itself
    #  to provision and manage API Keys but you'll need to provision your first API
    #  key from the  (https://dashboard.ngrok.com/api/keys)API Keys page on your
    #  ngrok.com dashboard.
    #
    # @return [NgrokAPI::Services::APIKeysClient]
    def api_keys
      @_api_keys ||= NgrokAPI::Services::APIKeysClient.new(client: @client)
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
    #  the ngrok authtoken command or by specifying it in the ngrok.yml
    #  configuration file with the authtoken property.
    #
    # @return [NgrokAPI::Services::CredentialsClient]
    def credentials
      @_credentials ||= NgrokAPI::Services::CredentialsClient.new(client: @client)
    end

    ##
    # Endpoint Configurations are a reusable group of modules that encapsulate how
    #  traffic to a domain or address is handled. Endpoint configurations are only
    #  applied to Domains and TCP Addresses they have been attached to.
    #
    # @return [NgrokAPI::Services::EndpointConfigurationsClient]
    def endpoint_configurations
      @_endpoint_configurations ||= NgrokAPI::Services::EndpointConfigurationsClient.new(client: @client)
    end

    def event_streams
      @_event_streams ||= NgrokAPI::Services::EventStreamsClient.new(client: @client)
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
    # IP Policies are reusable groups of CIDR ranges with an allow or deny
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
    #  initate traffic to a specific aspect of your ngrok account. An IP
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
    # The IP Whitelist is deprecated and will be removed. Use an IP Restriction
    #  with an endpoints type instead.
    #
    # @return [NgrokAPI::Services::IPWhitelistClient]
    def ip_whitelist
      @_ip_whitelist ||= NgrokAPI::Services::IPWhitelistClient.new(client: @client)
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
    # Tunnel Sessions represent instances of ngrok agents or SSH reverse tunnel
    #  sessions that are running and connected to the ngrok service. Each tunnel
    #  session can include one or more Tunnels.
    #
    # @return [NgrokAPI::Services::TunnelSessionsClient]
    def tunnel_sessions
      @_tunnel_sessions ||= NgrokAPI::Services::TunnelSessionsClient.new(client: @client)
    end

    ##
    # Tunnels provide endpoints to access services exposed by a running ngrok
    #  agent tunnel session or an SSH reverse tunnel session.
    #
    # @return [NgrokAPI::Services::TunnelsClient]
    def tunnels
      @_tunnels ||= NgrokAPI::Services::TunnelsClient.new(client: @client)
    end
  end
end
