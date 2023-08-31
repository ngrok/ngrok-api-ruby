# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::EdgesHTTPSRoutesClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/edges/https/%{edge_id}/routes' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: https_edge_route_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @edges_https_routes_client = NgrokAPI::Services::EdgesHTTPSRoutesClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::HTTPSEdgeRoute" do
      path = '/edges/https/%{edge_id}/routes'
      replacements = {
        edge_id: https_edge_route_result["edge_id"],
      }
      data = {}
      data[:match_type] = "New match_type"
      data[:match] = "New match"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:backend] = "New backend"
      data[:ip_restriction] = "New ip_restriction"
      data[:circuit_breaker] = "New circuit_breaker"
      data[:compression] = "New compression"
      data[:request_headers] = "New request_headers"
      data[:response_headers] = "New response_headers"
      data[:webhook_verification] = "New webhook_verification"
      data[:oauth] = "New oauth"
      data[:saml] = "New saml"
      data[:oidc] = "New oidc"
      data[:websocket_tcp_converter] = "New websocket_tcp_converter"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(https_edge_route_result)
      result = @edges_https_routes_client.create(
        edge_id: https_edge_route_result["edge_id"],
        match_type: "New match_type",
        match: "New match",
        description: "New description",
        metadata: "New metadata",
        backend: "New backend",
        ip_restriction: "New ip_restriction",
        circuit_breaker: "New circuit_breaker",
        compression: "New compression",
        request_headers: "New request_headers",
        response_headers: "New response_headers",
        webhook_verification: "New webhook_verification",
        oauth: "New oauth",
        saml: "New saml",
        oidc: "New oidc",
        websocket_tcp_converter: "New websocket_tcp_converter"
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdgeRoute)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::HTTPSEdgeRoute" do
      path = '/edges/https/%{edge_id}/routes'
      replacements = {
        edge_id: https_edge_route_result["edge_id"],
      }
      data = {}
      data[:match_type] = "New match_type"
      data[:match] = "New match"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:backend] = "New backend"
      data[:ip_restriction] = "New ip_restriction"
      data[:circuit_breaker] = "New circuit_breaker"
      data[:compression] = "New compression"
      data[:request_headers] = "New request_headers"
      data[:response_headers] = "New response_headers"
      data[:webhook_verification] = "New webhook_verification"
      data[:oauth] = "New oauth"
      data[:saml] = "New saml"
      data[:oidc] = "New oidc"
      data[:websocket_tcp_converter] = "New websocket_tcp_converter"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(https_edge_route_result)
      result = @edges_https_routes_client.create(
        edge_id: https_edge_route_result["edge_id"],
        match_type: "New match_type",
        match: "New match",
        description: "New description",
        metadata: "New metadata",
        backend: "New backend",
        ip_restriction: "New ip_restriction",
        circuit_breaker: "New circuit_breaker",
        compression: "New compression",
        request_headers: "New request_headers",
        response_headers: "New response_headers",
        webhook_verification: "New webhook_verification",
        oauth: "New oauth",
        saml: "New saml",
        oidc: "New oidc",
        websocket_tcp_converter: "New websocket_tcp_converter"
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdgeRoute)
      # expect(result.id).to eq(https_edge_route_result["id"])
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::HTTPSEdgeRoute" do
      path = '/edges/https/%{edge_id}/routes/%{id}'
      replacements = {
        edge_id: https_edge_route_result["edge_id"],
        id: https_edge_route_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(https_edge_route_result)
      result = @edges_https_routes_client.get(
        edge_id: https_edge_route_result["edge_id"],
        id: https_edge_route_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdgeRoute)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::HTTPSEdgeRoute" do
      path = '/edges/https/%{edge_id}/routes/%{id}'
      replacements = {
        edge_id: https_edge_route_result["edge_id"],
        id: https_edge_route_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(https_edge_route_result)
      result = @edges_https_routes_client.get(
        edge_id: https_edge_route_result["edge_id"],
        id: https_edge_route_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdgeRoute)
      # expect(result.id).to eq(https_edge_route_result["id"])
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::HTTPSEdgeRoute" do
      path = '/edges/https/%{edge_id}/routes/%{id}'
      replacements = {
        edge_id: https_edge_route_result["edge_id"],
        id: https_edge_route_result["id"],
      }
      data = {}
      data[:match_type] = "New match_type"
      data[:match] = "New match"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:backend] = "New backend"
      data[:ip_restriction] = "New ip_restriction"
      data[:circuit_breaker] = "New circuit_breaker"
      data[:compression] = "New compression"
      data[:request_headers] = "New request_headers"
      data[:response_headers] = "New response_headers"
      data[:webhook_verification] = "New webhook_verification"
      data[:oauth] = "New oauth"
      data[:saml] = "New saml"
      data[:oidc] = "New oidc"
      data[:websocket_tcp_converter] = "New websocket_tcp_converter"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(https_edge_route_result)
      result = @edges_https_routes_client.update(
        edge_id: https_edge_route_result["edge_id"],
        id: https_edge_route_result["id"],
        match_type: "New match_type",
        match: "New match",
        description: "New description",
        metadata: "New metadata",
        backend: "New backend",
        ip_restriction: "New ip_restriction",
        circuit_breaker: "New circuit_breaker",
        compression: "New compression",
        request_headers: "New request_headers",
        response_headers: "New response_headers",
        webhook_verification: "New webhook_verification",
        oauth: "New oauth",
        saml: "New saml",
        oidc: "New oidc",
        websocket_tcp_converter: "New websocket_tcp_converter"
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdgeRoute)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::HTTPSEdgeRoute" do
      path = '/edges/https/%{edge_id}/routes/%{id}'
      replacements = {
        edge_id: https_edge_route_result["edge_id"],
        id: https_edge_route_result["id"],
      }
      data = {}
      data[:match_type] = "New match_type"
      data[:match] = "New match"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:backend] = "New backend"
      data[:ip_restriction] = "New ip_restriction"
      data[:circuit_breaker] = "New circuit_breaker"
      data[:compression] = "New compression"
      data[:request_headers] = "New request_headers"
      data[:response_headers] = "New response_headers"
      data[:webhook_verification] = "New webhook_verification"
      data[:oauth] = "New oauth"
      data[:saml] = "New saml"
      data[:oidc] = "New oidc"
      data[:websocket_tcp_converter] = "New websocket_tcp_converter"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(https_edge_route_result)
      result = @edges_https_routes_client.update(
        edge_id: https_edge_route_result["edge_id"],
        id: https_edge_route_result["id"],
        match_type: "New match_type",
        match: "New match",
        description: "New description",
        metadata: "New metadata",
        backend: "New backend",
        ip_restriction: "New ip_restriction",
        circuit_breaker: "New circuit_breaker",
        compression: "New compression",
        request_headers: "New request_headers",
        response_headers: "New response_headers",
        webhook_verification: "New webhook_verification",
        oauth: "New oauth",
        saml: "New saml",
        oidc: "New oidc",
        websocket_tcp_converter: "New websocket_tcp_converter"
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdgeRoute)
      # expect(result.id).to eq(https_edge_route_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/edges/https/%{edge_id}/routes/%{id}'
      replacements = {
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @edges_https_routes_client.delete(
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/edges/https/%{edge_id}/routes/%{id}'
      replacements = {
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @edges_https_routes_client.delete!(
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/edges/https/%{edge_id}/routes/%{id}'
      replacements = {
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @edges_https_routes_client.delete!(
          edge_id: api_key_result["edge_id"],
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
