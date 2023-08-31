# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::TunnelGroupBackendsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/backends/tunnel_group' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: tunnel_group_backend_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @tunnel_group_backends_client = NgrokAPI::Services::TunnelGroupBackendsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::TunnelGroupBackend" do
      path = '/backends/tunnel_group'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:labels] = "New labels"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(tunnel_group_backend_result)
      result = @tunnel_group_backends_client.create(
        description: "New description",
        metadata: "New metadata",
        labels: "New labels"
      )
      expect(result.class).to eq(NgrokAPI::Models::TunnelGroupBackend)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::TunnelGroupBackend" do
      path = '/backends/tunnel_group'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:labels] = "New labels"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(tunnel_group_backend_result)
      result = @tunnel_group_backends_client.create(
        description: "New description",
        metadata: "New metadata",
        labels: "New labels"
      )
      expect(result.class).to eq(NgrokAPI::Models::TunnelGroupBackend)
      # expect(result.id).to eq(tunnel_group_backend_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/backends/tunnel_group/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @tunnel_group_backends_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/backends/tunnel_group/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @tunnel_group_backends_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/backends/tunnel_group/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @tunnel_group_backends_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::TunnelGroupBackend" do
      path = '/backends/tunnel_group/%{id}'
      replacements = {
        id: tunnel_group_backend_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(tunnel_group_backend_result)
      result = @tunnel_group_backends_client.get(
        id: tunnel_group_backend_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::TunnelGroupBackend)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::TunnelGroupBackend" do
      path = '/backends/tunnel_group/%{id}'
      replacements = {
        id: tunnel_group_backend_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(tunnel_group_backend_result)
      result = @tunnel_group_backends_client.get(
        id: tunnel_group_backend_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::TunnelGroupBackend)
      # expect(result.id).to eq(tunnel_group_backend_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(tunnel_group_backend_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @tunnel_group_backends_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::TunnelGroupBackend" do
      path = '/backends/tunnel_group/%{id}'
      replacements = {
        id: tunnel_group_backend_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:labels] = "New labels"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(tunnel_group_backend_result)
      result = @tunnel_group_backends_client.update(
        id: tunnel_group_backend_result["id"],
        description: "New description",
        metadata: "New metadata",
        labels: "New labels"
      )
      expect(result.class).to eq(NgrokAPI::Models::TunnelGroupBackend)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::TunnelGroupBackend" do
      path = '/backends/tunnel_group/%{id}'
      replacements = {
        id: tunnel_group_backend_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:labels] = "New labels"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(tunnel_group_backend_result)
      result = @tunnel_group_backends_client.update(
        id: tunnel_group_backend_result["id"],
        description: "New description",
        metadata: "New metadata",
        labels: "New labels"
      )
      expect(result.class).to eq(NgrokAPI::Models::TunnelGroupBackend)
      # expect(result.id).to eq(tunnel_group_backend_result["id"])
    end
  end
end
