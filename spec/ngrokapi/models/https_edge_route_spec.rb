# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::HTTPSEdgeRoute do
  before(:each) do
    @client = class_double("HTTPSEdgeRoutesClient")
    @https_edge_route = NgrokAPI::Models::HTTPSEdgeRoute.new(client: @client, attrs: https_edge_route_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::HTTPSEdgeRoute.new(client: @client, attrs: https_edge_route_result)
      expect(@https_edge_route == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@https_edge_route.to_s).to eq https_edge_route_result.to_s
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_match_type = 'New match_type'
      new_match = 'New match'
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_backend = 'New backend'
      new_ip_restriction = 'New ip_restriction'
      new_circuit_breaker = 'New circuit_breaker'
      new_compression = 'New compression'
      new_request_headers = 'New request_headers'
      new_response_headers = 'New response_headers'
      new_webhook_verification = 'New webhook_verification'
      new_oauth = 'New oauth'
      new_saml = 'New saml'
      new_oidc = 'New oidc'
      new_websocket_tcp_converter = 'New websocket_tcp_converter'
      expect(@https_edge_route.client).to receive(:update)
      @https_edge_route.update(
        match_type: new_match_type,
        match: new_match,
        description: new_description,
        metadata: new_metadata,
        backend: new_backend,
        ip_restriction: new_ip_restriction,
        circuit_breaker: new_circuit_breaker,
        compression: new_compression,
        request_headers: new_request_headers,
        response_headers: new_response_headers,
        webhook_verification: new_webhook_verification,
        oauth: new_oauth,
        saml: new_saml,
        oidc: new_oidc,
        websocket_tcp_converter: new_websocket_tcp_converter
      )
      expect(@https_edge_route.match_type).to eq new_match_type
      expect(@https_edge_route.match).to eq new_match
      expect(@https_edge_route.description).to eq new_description
      expect(@https_edge_route.metadata).to eq new_metadata
      expect(@https_edge_route.backend).to eq new_backend
      expect(@https_edge_route.ip_restriction).to eq new_ip_restriction
      expect(@https_edge_route.circuit_breaker).to eq new_circuit_breaker
      expect(@https_edge_route.compression).to eq new_compression
      expect(@https_edge_route.request_headers).to eq new_request_headers
      expect(@https_edge_route.response_headers).to eq new_response_headers
      expect(@https_edge_route.webhook_verification).to eq new_webhook_verification
      expect(@https_edge_route.oauth).to eq new_oauth
      expect(@https_edge_route.saml).to eq new_saml
      expect(@https_edge_route.oidc).to eq new_oidc
      expect(@https_edge_route.websocket_tcp_converter).to eq new_websocket_tcp_converter
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@https_edge_route.client).to receive(:delete)
      @https_edge_route.delete
    end
  end
end
