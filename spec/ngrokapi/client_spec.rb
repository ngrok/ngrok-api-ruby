require 'spec_helper'

RSpec.describe NgrokAPI::Client do
  before(:each) do
    api_key = 'abc'
    @client = NgrokAPI::Client.new(api_key: api_key)
  end

  describe "#api_keys" do
    it "returns an instance of the api_keys_client" do
      expect(@client.api_keys.class).to eq(NgrokAPI::Services::ApiKeysClient)
    end
  end

  describe "#endpoint_configurations" do
    it "returns an instance of the endpoint_configurations_client" do
      expect(@client.endpoint_configurations.class).to eq(
        NgrokAPI::Services::EndpointConfigurationsClient
      )
    end
  end

  describe "#reserved_domains" do
    it "returns an instance of the reserved_domains_client" do
      expect(@client.reserved_domains.class).to eq(NgrokAPI::Services::ReservedDomainsClient)
    end
  end

  describe "#tls_certificates" do
    it "returns an instance of the tls_certificates_client" do
      expect(@client.tls_certificates.class).to eq(NgrokAPI::Services::TlsCertificatesClient)
    end
  end
end
