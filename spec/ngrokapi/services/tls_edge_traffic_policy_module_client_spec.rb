# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::TLSEdgeTrafficPolicyModuleClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/edges/tls/%{id}/traffic_policy' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: endpoint_traffic_policy_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @tls_edge_traffic_policy_module_client = NgrokAPI::Services::TLSEdgeTrafficPolicyModuleClient.new(client: @client)
  end

  describe "#replace" do
    it "will make a put request and return an instance of NgrokAPI::Models::EndpointTrafficPolicy" do
      path = '/edges/tls/%{id}/traffic_policy'
      replacements = {
        id: endpoint_traffic_policy_result["id"],
      }
      data = "New a_module"
      expect(@client).to receive(:put).with(path % replacements, data: data).
        and_return(endpoint_traffic_policy_result)
      result = @tls_edge_traffic_policy_module_client.replace(
        id: endpoint_traffic_policy_result["id"],
        a_module: "New a_module"
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointTrafficPolicy)
    end
  end

  describe "#replace!" do
    it "will make a put request and return an instance of NgrokAPI::Models::EndpointTrafficPolicy" do
      path = '/edges/tls/%{id}/traffic_policy'
      replacements = {
        id: endpoint_traffic_policy_result["id"],
      }
      data = "New a_module"
      expect(@client).to receive(:put).with(path % replacements, data: data).
        and_return(endpoint_traffic_policy_result)
      result = @tls_edge_traffic_policy_module_client.replace(
        id: endpoint_traffic_policy_result["id"],
        a_module: "New a_module"
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointTrafficPolicy)
      # expect(result.id).to eq(endpoint_traffic_policy_result["id"])
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::EndpointTrafficPolicy" do
      path = '/edges/tls/%{id}/traffic_policy'
      replacements = {
        id: endpoint_traffic_policy_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_traffic_policy_result)
      result = @tls_edge_traffic_policy_module_client.get(
        id: endpoint_traffic_policy_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointTrafficPolicy)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::EndpointTrafficPolicy" do
      path = '/edges/tls/%{id}/traffic_policy'
      replacements = {
        id: endpoint_traffic_policy_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_traffic_policy_result)
      result = @tls_edge_traffic_policy_module_client.get(
        id: endpoint_traffic_policy_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointTrafficPolicy)
      # expect(result.id).to eq(endpoint_traffic_policy_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/edges/tls/%{id}/traffic_policy'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @tls_edge_traffic_policy_module_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/edges/tls/%{id}/traffic_policy'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @tls_edge_traffic_policy_module_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/edges/tls/%{id}/traffic_policy'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @tls_edge_traffic_policy_module_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
