require 'spec_helper'

RSpec.describe NgrokAPI::Services::ReservedAddrsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/reserved_addrs' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: reserved_addr_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @reserved_addrs_client = NgrokAPI::Services::ReservedAddrsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::ReservedAddr" do
      path = '/reserved_addrs'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:region] = "New region"
      data[:endpoint_configuration_id] = "New endpoint_configuration_id"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(reserved_addr_result)
      result = @reserved_addrs_client.create(
        description: "New description",
        metadata: "New metadata",
        region: "New region",
        endpoint_configuration_id: "New endpoint_configuration_id"
      )
      expect(result.class).to eq(NgrokAPI::Models::ReservedAddr)
      # expect(result.id).to eq(reserved_addr_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/reserved_addrs/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @reserved_addrs_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/reserved_addrs/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @reserved_addrs_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/reserved_addrs/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @reserved_addrs_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::ReservedAddr" do
      path = '/reserved_addrs/%{id}'
      replacements = {
        id: reserved_addr_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(reserved_addr_result)
      result = @reserved_addrs_client.get(
        id: reserved_addr_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::ReservedAddr)
      # expect(result.id).to eq(reserved_addr_result["id"])
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::ReservedAddr" do
      path = '/reserved_addrs/%{id}'
      replacements = {
        id: reserved_addr_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(reserved_addr_result)
      result = @reserved_addrs_client.get(
        id: reserved_addr_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::ReservedAddr)
      # expect(result.id).to eq(reserved_addr_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(reserved_addr_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @reserved_addrs_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::ReservedAddr" do
      path = '/reserved_addrs/%{id}'
      replacements = {
        id: reserved_addr_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:endpoint_configuration_id] = "New endpoint_configuration_id"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(reserved_addr_result)
      result = @reserved_addrs_client.update(
        id: reserved_addr_result["id"],
        description: "New description",
        metadata: "New metadata",
        endpoint_configuration_id: "New endpoint_configuration_id"
      )
      expect(result.class).to eq(NgrokAPI::Models::ReservedAddr)
      # expect(result.id).to eq(reserved_addr_result["id"])
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::ReservedAddr" do
      path = '/reserved_addrs/%{id}'
      replacements = {
        id: reserved_addr_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:endpoint_configuration_id] = "New endpoint_configuration_id"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(reserved_addr_result)
      result = @reserved_addrs_client.update(
        id: reserved_addr_result["id"],
        description: "New description",
        metadata: "New metadata",
        endpoint_configuration_id: "New endpoint_configuration_id"
      )
      expect(result.class).to eq(NgrokAPI::Models::ReservedAddr)
      # expect(result.id).to eq(reserved_addr_result["id"])
    end
  end

  describe "#delete_endpoint_config" do
    it "will make a delete request" do
      path = '/reserved_addrs/%{id}/endpoint_configuration'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @reserved_addrs_client.delete_endpoint_config(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete_endpoint_config!" do
    it "will make a delete request" do
      path = '/reserved_addrs/%{id}/endpoint_configuration'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @reserved_addrs_client.delete_endpoint_config!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/reserved_addrs/%{id}/endpoint_configuration'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @reserved_addrs_client.delete_endpoint_config!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
