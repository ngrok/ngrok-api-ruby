require 'spec_helper'

RSpec.describe NgrokAPI::Services::EdgeRouteRequestHeadersModuleClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/edges/https/%{edge_id}/routes/%{id}/request_headers' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: endpoint_request_headers_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @edge_route_request_headers_module_client = NgrokAPI::Services::EdgeRouteRequestHeadersModuleClient.new(client: @client)
  end

  describe "#replace" do
    it "will make a put request and return an instance of NgrokAPI::Models::EndpointRequestHeaders" do
      path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
      replacements = {
        edge_id: endpoint_request_headers_result["edge_id"],
        id: endpoint_request_headers_result["id"],
      }
      data = {}
      data[:module] = "New a_module"
      expect(@client).to receive(:put).with(path % replacements, data: data).
        and_return(endpoint_request_headers_result)
      result = @edge_route_request_headers_module_client.replace(
        edge_id: endpoint_request_headers_result["edge_id"],
        id: endpoint_request_headers_result["id"],
        a_module: "New a_module"
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointRequestHeaders)
    end
  end

  describe "#replace!" do
    it "will make a put request and return an instance of NgrokAPI::Models::EndpointRequestHeaders" do
      path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
      replacements = {
        edge_id: endpoint_request_headers_result["edge_id"],
        id: endpoint_request_headers_result["id"],
      }
      data = {}
      data[:module] = "New a_module"
      expect(@client).to receive(:put).with(path % replacements, data: data).
        and_return(endpoint_request_headers_result)
      result = @edge_route_request_headers_module_client.replace(
        edge_id: endpoint_request_headers_result["edge_id"],
        id: endpoint_request_headers_result["id"],
        a_module: "New a_module"
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointRequestHeaders)
      # expect(result.id).to eq(endpoint_request_headers_result["id"])
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::EndpointRequestHeaders" do
      path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
      replacements = {
        edge_id: endpoint_request_headers_result["edge_id"],
        id: endpoint_request_headers_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_request_headers_result)
      result = @edge_route_request_headers_module_client.get(
        edge_id: endpoint_request_headers_result["edge_id"],
        id: endpoint_request_headers_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointRequestHeaders)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::EndpointRequestHeaders" do
      path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
      replacements = {
        edge_id: endpoint_request_headers_result["edge_id"],
        id: endpoint_request_headers_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_request_headers_result)
      result = @edge_route_request_headers_module_client.get(
        edge_id: endpoint_request_headers_result["edge_id"],
        id: endpoint_request_headers_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointRequestHeaders)
      # expect(result.id).to eq(endpoint_request_headers_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
      replacements = {
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @edge_route_request_headers_module_client.delete(
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
      replacements = {
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @edge_route_request_headers_module_client.delete!(
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/edges/https/%{edge_id}/routes/%{id}/request_headers'
      replacements = {
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @edge_route_request_headers_module_client.delete!(
          edge_id: api_key_result["edge_id"],
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
