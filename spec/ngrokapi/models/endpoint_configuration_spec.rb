require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointConfiguration do
  before(:each) do
    @client = class_double("EndpointConfigurationsClient")
    @endpoint_configuration = NgrokAPI::Models::EndpointConfiguration.new(client: @client, result: endpoint_configuration_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointConfiguration.new(client: @client, result: endpoint_configuration_result)
      expect(@endpoint_configuration == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_configuration.to_s).to eq endpoint_configuration_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@endpoint_configuration.client).to receive(:delete)
      @endpoint_configuration.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_circuit_breaker = 'New circuit_breaker'
      new_compression = 'New compression'
      new_request_headers = 'New request_headers'
      new_response_headers = 'New response_headers'
      new_ip_policy = 'New ip_policy'
      new_mutual_tls = 'New mutual_tls'
      new_tls_termination = 'New tls_termination'
      new_webhook_validation = 'New webhook_validation'
      new_oauth = 'New oauth'
      new_logging = 'New logging'
      new_saml = 'New saml'
      new_oidc = 'New oidc'
      expect(@endpoint_configuration.client).to receive(:update)
      @endpoint_configuration.update(
        description: new_description,
        metadata: new_metadata,
        circuit_breaker: new_circuit_breaker,
        compression: new_compression,
        request_headers: new_request_headers,
        response_headers: new_response_headers,
        ip_policy: new_ip_policy,
        mutual_tls: new_mutual_tls,
        tls_termination: new_tls_termination,
        webhook_validation: new_webhook_validation,
        oauth: new_oauth,
        logging: new_logging,
        saml: new_saml,
        oidc: new_oidc
      )
      expect(@endpoint_configuration.description).to eq new_description
      expect(@endpoint_configuration.metadata).to eq new_metadata
      expect(@endpoint_configuration.circuit_breaker).to eq new_circuit_breaker
      expect(@endpoint_configuration.compression).to eq new_compression
      expect(@endpoint_configuration.request_headers).to eq new_request_headers
      expect(@endpoint_configuration.response_headers).to eq new_response_headers
      expect(@endpoint_configuration.ip_policy).to eq new_ip_policy
      expect(@endpoint_configuration.mutual_tls).to eq new_mutual_tls
      expect(@endpoint_configuration.tls_termination).to eq new_tls_termination
      expect(@endpoint_configuration.webhook_validation).to eq new_webhook_validation
      expect(@endpoint_configuration.oauth).to eq new_oauth
      expect(@endpoint_configuration.logging).to eq new_logging
      expect(@endpoint_configuration.saml).to eq new_saml
      expect(@endpoint_configuration.oidc).to eq new_oidc
    end
  end
end
