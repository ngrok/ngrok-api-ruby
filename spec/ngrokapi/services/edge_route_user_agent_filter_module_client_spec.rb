# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::EdgeRouteUserAgentFilterModuleClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/edges/https/%{edge_id}/routes/%{id}/user_agent_filter' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: endpoint_user_agent_filter_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @edge_route_user_agent_filter_module_client = NgrokAPI::Services::EdgeRouteUserAgentFilterModuleClient.new(client: @client)
  end

  describe "#replace" do
    it "will make a put request and return an instance of NgrokAPI::Models::EndpointUserAgentFilter" do
      path = '/edges/https/%{edge_id}/routes/%{id}/user_agent_filter'
      replacements = {
        edge_id: endpoint_user_agent_filter_result["edge_id"],
        id: endpoint_user_agent_filter_result["id"],
      }
      data = "New a_module"
      expect(@client).to receive(:put).with(path % replacements, data: data).
        and_return(endpoint_user_agent_filter_result)
      result = @edge_route_user_agent_filter_module_client.replace(
        edge_id: endpoint_user_agent_filter_result["edge_id"],
        id: endpoint_user_agent_filter_result["id"],
        a_module: "New a_module"
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointUserAgentFilter)
    end
  end

  describe "#replace!" do
    it "will make a put request and return an instance of NgrokAPI::Models::EndpointUserAgentFilter" do
      path = '/edges/https/%{edge_id}/routes/%{id}/user_agent_filter'
      replacements = {
        edge_id: endpoint_user_agent_filter_result["edge_id"],
        id: endpoint_user_agent_filter_result["id"],
      }
      data = "New a_module"
      expect(@client).to receive(:put).with(path % replacements, data: data).
        and_return(endpoint_user_agent_filter_result)
      result = @edge_route_user_agent_filter_module_client.replace(
        edge_id: endpoint_user_agent_filter_result["edge_id"],
        id: endpoint_user_agent_filter_result["id"],
        a_module: "New a_module"
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointUserAgentFilter)
      # expect(result.id).to eq(endpoint_user_agent_filter_result["id"])
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::EndpointUserAgentFilter" do
      path = '/edges/https/%{edge_id}/routes/%{id}/user_agent_filter'
      replacements = {
        edge_id: endpoint_user_agent_filter_result["edge_id"],
        id: endpoint_user_agent_filter_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_user_agent_filter_result)
      result = @edge_route_user_agent_filter_module_client.get(
        edge_id: endpoint_user_agent_filter_result["edge_id"],
        id: endpoint_user_agent_filter_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointUserAgentFilter)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::EndpointUserAgentFilter" do
      path = '/edges/https/%{edge_id}/routes/%{id}/user_agent_filter'
      replacements = {
        edge_id: endpoint_user_agent_filter_result["edge_id"],
        id: endpoint_user_agent_filter_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_user_agent_filter_result)
      result = @edge_route_user_agent_filter_module_client.get(
        edge_id: endpoint_user_agent_filter_result["edge_id"],
        id: endpoint_user_agent_filter_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointUserAgentFilter)
      # expect(result.id).to eq(endpoint_user_agent_filter_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/edges/https/%{edge_id}/routes/%{id}/user_agent_filter'
      replacements = {
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @edge_route_user_agent_filter_module_client.delete(
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/edges/https/%{edge_id}/routes/%{id}/user_agent_filter'
      replacements = {
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @edge_route_user_agent_filter_module_client.delete!(
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/edges/https/%{edge_id}/routes/%{id}/user_agent_filter'
      replacements = {
        edge_id: api_key_result["edge_id"],
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @edge_route_user_agent_filter_module_client.delete!(
          edge_id: api_key_result["edge_id"],
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
