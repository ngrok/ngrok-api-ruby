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

  describe "#endpoint_configurations" do
    it "returns an instance of the EndpointConfigurationsClient" do
      expect(@client.endpoint_configurations.class).to eq(NgrokAPI::Services::EndpointConfigurationsClient)
    end
  end

  describe "#event_streams" do
    it "returns an instance of the EventStreamsClient" do
      expect(@client.event_streams.class).to eq(NgrokAPI::Services::EventStreamsClient)
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

  describe "#tunnel_sessions" do
    it "returns an instance of the TunnelSessionsClient" do
      expect(@client.tunnel_sessions.class).to eq(NgrokAPI::Services::TunnelSessionsClient)
    end
  end

  describe "#tunnels" do
    it "returns an instance of the TunnelsClient" do
      expect(@client.tunnels.class).to eq(NgrokAPI::Services::TunnelsClient)
    end
  end

  describe "#pointcfg_module" do
    it "returns an instance of OpenStruct covering namespaces" do
      ns = @client.pointcfg_module
      expect(ns.logging.class).to eq(NgrokAPI::Services::EndpointLoggingModuleClient)
      expect(ns.circuit_breaker.class).to eq(NgrokAPI::Services::EndpointCircuitBreakerModuleClient)
      expect(ns.compression.class).to eq(NgrokAPI::Services::EndpointCompressionModuleClient)
      expect(ns.tls_termination.class).to eq(NgrokAPI::Services::EndpointTLSTerminationModuleClient)
      expect(ns.ip_policy.class).to eq(NgrokAPI::Services::EndpointIPPolicyModuleClient)
      expect(ns.mutual_tls.class).to eq(NgrokAPI::Services::EndpointMutualTLSModuleClient)
      expect(ns.request_headers.class).to eq(NgrokAPI::Services::EndpointRequestHeadersModuleClient)
      expect(ns.response_headers.class).to eq(NgrokAPI::Services::EndpointResponseHeadersModuleClient)
      expect(ns.oauth.class).to eq(NgrokAPI::Services::EndpointOAuthModuleClient)
      expect(ns.webhook_validation.class).to eq(NgrokAPI::Services::EndpointWebhookValidationModuleClient)
      expect(ns.saml.class).to eq(NgrokAPI::Services::EndpointSAMLModuleClient)
      expect(ns.oidc.class).to eq(NgrokAPI::Services::EndpointOIDCModuleClient)
    end
  end
end
