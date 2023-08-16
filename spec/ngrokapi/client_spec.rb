# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'
require 'ostruct'

RSpec.describe NgrokAPI::Client do
  before(:each) do
    @client = NgrokAPI::Client.new(api_key: 'abc')
  end

  describe "#abuse_reports" do
    it "returns an instance of the AbuseReportsClient" do
      expect(@client.abuse_reports.class).to eq(NgrokAPI::Services::AbuseReportsClient)
    end
  end

  describe "#agent_ingresses" do
    it "returns an instance of the AgentIngressesClient" do
      expect(@client.agent_ingresses.class).to eq(NgrokAPI::Services::AgentIngressesClient)
    end
  end

  describe "#api_keys" do
    it "returns an instance of the APIKeysClient" do
      expect(@client.api_keys.class).to eq(NgrokAPI::Services::APIKeysClient)
    end
  end

  describe "#application_sessions" do
    it "returns an instance of the ApplicationSessionsClient" do
      expect(@client.application_sessions.class).to eq(NgrokAPI::Services::ApplicationSessionsClient)
    end
  end

  describe "#application_users" do
    it "returns an instance of the ApplicationUsersClient" do
      expect(@client.application_users.class).to eq(NgrokAPI::Services::ApplicationUsersClient)
    end
  end

  describe "#tunnel_sessions" do
    it "returns an instance of the TunnelSessionsClient" do
      expect(@client.tunnel_sessions.class).to eq(NgrokAPI::Services::TunnelSessionsClient)
    end
  end

  describe "#certificate_authorities" do
    it "returns an instance of the CertificateAuthoritiesClient" do
      expect(@client.certificate_authorities.class).to eq(NgrokAPI::Services::CertificateAuthoritiesClient)
    end
  end

  describe "#credentials" do
    it "returns an instance of the CredentialsClient" do
      expect(@client.credentials.class).to eq(NgrokAPI::Services::CredentialsClient)
    end
  end

  describe "#endpoints" do
    it "returns an instance of the EndpointsClient" do
      expect(@client.endpoints.class).to eq(NgrokAPI::Services::EndpointsClient)
    end
  end

  describe "#event_destinations" do
    it "returns an instance of the EventDestinationsClient" do
      expect(@client.event_destinations.class).to eq(NgrokAPI::Services::EventDestinationsClient)
    end
  end

  describe "#event_subscriptions" do
    it "returns an instance of the EventSubscriptionsClient" do
      expect(@client.event_subscriptions.class).to eq(NgrokAPI::Services::EventSubscriptionsClient)
    end
  end

  describe "#event_sources" do
    it "returns an instance of the EventSourcesClient" do
      expect(@client.event_sources.class).to eq(NgrokAPI::Services::EventSourcesClient)
    end
  end

  describe "#ip_policies" do
    it "returns an instance of the IPPoliciesClient" do
      expect(@client.ip_policies.class).to eq(NgrokAPI::Services::IPPoliciesClient)
    end
  end

  describe "#ip_policy_rules" do
    it "returns an instance of the IPPolicyRulesClient" do
      expect(@client.ip_policy_rules.class).to eq(NgrokAPI::Services::IPPolicyRulesClient)
    end
  end

  describe "#ip_restrictions" do
    it "returns an instance of the IPRestrictionsClient" do
      expect(@client.ip_restrictions.class).to eq(NgrokAPI::Services::IPRestrictionsClient)
    end
  end

  describe "#reserved_addrs" do
    it "returns an instance of the ReservedAddrsClient" do
      expect(@client.reserved_addrs.class).to eq(NgrokAPI::Services::ReservedAddrsClient)
    end
  end

  describe "#reserved_domains" do
    it "returns an instance of the ReservedDomainsClient" do
      expect(@client.reserved_domains.class).to eq(NgrokAPI::Services::ReservedDomainsClient)
    end
  end

  describe "#ssh_certificate_authorities" do
    it "returns an instance of the SSHCertificateAuthoritiesClient" do
      expect(@client.ssh_certificate_authorities.class).to eq(NgrokAPI::Services::SSHCertificateAuthoritiesClient)
    end
  end

  describe "#ssh_credentials" do
    it "returns an instance of the SSHCredentialsClient" do
      expect(@client.ssh_credentials.class).to eq(NgrokAPI::Services::SSHCredentialsClient)
    end
  end

  describe "#ssh_host_certificates" do
    it "returns an instance of the SSHHostCertificatesClient" do
      expect(@client.ssh_host_certificates.class).to eq(NgrokAPI::Services::SSHHostCertificatesClient)
    end
  end

  describe "#ssh_user_certificates" do
    it "returns an instance of the SSHUserCertificatesClient" do
      expect(@client.ssh_user_certificates.class).to eq(NgrokAPI::Services::SSHUserCertificatesClient)
    end
  end

  describe "#tls_certificates" do
    it "returns an instance of the TLSCertificatesClient" do
      expect(@client.tls_certificates.class).to eq(NgrokAPI::Services::TLSCertificatesClient)
    end
  end

  describe "#tunnels" do
    it "returns an instance of the TunnelsClient" do
      expect(@client.tunnels.class).to eq(NgrokAPI::Services::TunnelsClient)
    end
  end

  describe "#backends" do
    it "returns an instance of OpenStruct covering namespaces" do
      ns = @client.backends
      expect(ns.failover.class).to eq(NgrokAPI::Services::FailoverBackendsClient)
      expect(ns.http_response.class).to eq(NgrokAPI::Services::HTTPResponseBackendsClient)
      expect(ns.tunnel_group.class).to eq(NgrokAPI::Services::TunnelGroupBackendsClient)
      expect(ns.weighted.class).to eq(NgrokAPI::Services::WeightedBackendsClient)
    end
  end

  describe "#edges" do
    it "returns an instance of OpenStruct covering namespaces" do
      ns = @client.edges
      expect(ns.https_routes.class).to eq(NgrokAPI::Services::EdgesHTTPSRoutesClient)
      expect(ns.https.class).to eq(NgrokAPI::Services::EdgesHTTPSClient)
      expect(ns.tcp.class).to eq(NgrokAPI::Services::EdgesTCPClient)
      expect(ns.tls.class).to eq(NgrokAPI::Services::EdgesTLSClient)
    end
  end

  describe "#edge_modules" do
    it "returns an instance of OpenStruct covering namespaces" do
      ns = @client.edge_modules
      expect(ns.https_edge_mutual_tls.class).to eq(NgrokAPI::Services::HTTPSEdgeMutualTLSModuleClient)
      expect(ns.https_edge_tls_termination.class).to eq(NgrokAPI::Services::HTTPSEdgeTLSTerminationModuleClient)
      expect(ns.https_edge_route_backend.class).to eq(NgrokAPI::Services::EdgeRouteBackendModuleClient)
      expect(ns.https_edge_route_ip_restriction.class).to eq(NgrokAPI::Services::EdgeRouteIPRestrictionModuleClient)
      expect(ns.https_edge_route_request_headers.class).to eq(NgrokAPI::Services::EdgeRouteRequestHeadersModuleClient)
      expect(ns.https_edge_route_response_headers.class).to eq(NgrokAPI::Services::EdgeRouteResponseHeadersModuleClient)
      expect(ns.https_edge_route_compression.class).to eq(NgrokAPI::Services::EdgeRouteCompressionModuleClient)
      expect(ns.https_edge_route_circuit_breaker.class).to eq(NgrokAPI::Services::EdgeRouteCircuitBreakerModuleClient)
      expect(ns.https_edge_route_webhook_verification.class).to eq(NgrokAPI::Services::EdgeRouteWebhookVerificationModuleClient)
      expect(ns.https_edge_route_oauth.class).to eq(NgrokAPI::Services::EdgeRouteOAuthModuleClient)
      expect(ns.https_edge_route_saml.class).to eq(NgrokAPI::Services::EdgeRouteSAMLModuleClient)
      expect(ns.https_edge_route_oidc.class).to eq(NgrokAPI::Services::EdgeRouteOIDCModuleClient)
      expect(ns.https_edge_route_websocket_tcp_converter.class).to eq(NgrokAPI::Services::EdgeRouteWebsocketTCPConverterModuleClient)
      expect(ns.tcp_edge_backend.class).to eq(NgrokAPI::Services::TCPEdgeBackendModuleClient)
      expect(ns.tcp_edge_ip_restriction.class).to eq(NgrokAPI::Services::TCPEdgeIPRestrictionModuleClient)
      expect(ns.tls_edge_backend.class).to eq(NgrokAPI::Services::TLSEdgeBackendModuleClient)
      expect(ns.tls_edge_ip_restriction.class).to eq(NgrokAPI::Services::TLSEdgeIPRestrictionModuleClient)
      expect(ns.tls_edge_mutual_tls.class).to eq(NgrokAPI::Services::TLSEdgeMutualTLSModuleClient)
      expect(ns.tls_edge_tls_termination.class).to eq(NgrokAPI::Services::TLSEdgeTLSTerminationModuleClient)
    end
  end
end
