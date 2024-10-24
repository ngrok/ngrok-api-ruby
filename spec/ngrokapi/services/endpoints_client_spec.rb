# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::EndpointsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/endpoints' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: endpoint_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @endpoints_client = NgrokAPI::Services::EndpointsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::Endpoint" do
      path = '/endpoints'
      replacements = {
      }
      data = {}
      data[:url] = "New url"
      data[:type] = "New type"
      data[:traffic_policy] = "New traffic_policy"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:bindings] = "New bindings"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(endpoint_result)
      result = @endpoints_client.create(
        url: "New url",
        type: "New type",
        traffic_policy: "New traffic_policy",
        description: "New description",
        metadata: "New metadata",
        bindings: "New bindings"
      )
      expect(result.class).to eq(NgrokAPI::Models::Endpoint)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::Endpoint" do
      path = '/endpoints'
      replacements = {
      }
      data = {}
      data[:url] = "New url"
      data[:type] = "New type"
      data[:traffic_policy] = "New traffic_policy"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:bindings] = "New bindings"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(endpoint_result)
      result = @endpoints_client.create(
        url: "New url",
        type: "New type",
        traffic_policy: "New traffic_policy",
        description: "New description",
        metadata: "New metadata",
        bindings: "New bindings"
      )
      expect(result.class).to eq(NgrokAPI::Models::Endpoint)
      # expect(result.id).to eq(endpoint_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(endpoint_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @endpoints_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::Endpoint" do
      path = '/endpoints/%{id}'
      replacements = {
        id: endpoint_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_result)
      result = @endpoints_client.get(
        id: endpoint_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::Endpoint)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::Endpoint" do
      path = '/endpoints/%{id}'
      replacements = {
        id: endpoint_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_result)
      result = @endpoints_client.get(
        id: endpoint_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::Endpoint)
      # expect(result.id).to eq(endpoint_result["id"])
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::Endpoint" do
      path = '/endpoints/%{id}'
      replacements = {
        id: endpoint_result["id"],
      }
      data = {}
      data[:url] = "New url"
      data[:traffic_policy] = "New traffic_policy"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:bindings] = "New bindings"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(endpoint_result)
      result = @endpoints_client.update(
        id: endpoint_result["id"],
        url: "New url",
        traffic_policy: "New traffic_policy",
        description: "New description",
        metadata: "New metadata",
        bindings: "New bindings"
      )
      expect(result.class).to eq(NgrokAPI::Models::Endpoint)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::Endpoint" do
      path = '/endpoints/%{id}'
      replacements = {
        id: endpoint_result["id"],
      }
      data = {}
      data[:url] = "New url"
      data[:traffic_policy] = "New traffic_policy"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:bindings] = "New bindings"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(endpoint_result)
      result = @endpoints_client.update(
        id: endpoint_result["id"],
        url: "New url",
        traffic_policy: "New traffic_policy",
        description: "New description",
        metadata: "New metadata",
        bindings: "New bindings"
      )
      expect(result.class).to eq(NgrokAPI::Models::Endpoint)
      # expect(result.id).to eq(endpoint_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/endpoints/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @endpoints_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/endpoints/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @endpoints_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/endpoints/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @endpoints_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
