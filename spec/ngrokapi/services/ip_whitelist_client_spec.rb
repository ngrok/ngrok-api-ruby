require 'spec_helper'

RSpec.describe NgrokAPI::Services::IPWhitelistClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/ip_whitelist' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: ip_whitelist_entry_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @ip_whitelist_client = NgrokAPI::Services::IPWhitelistClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::IPWhitelistEntry" do
      path = '/ip_whitelist'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:ip_net] = "New ip_net"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(ip_whitelist_entry_result)
      result = @ip_whitelist_client.create(
        description: "New description",
        metadata: "New metadata",
        ip_net: "New ip_net"
      )
      expect(result.class).to eq(NgrokAPI::Models::IPWhitelistEntry)
      # expect(result.id).to eq(ip_whitelist_entry_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/ip_whitelist/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @ip_whitelist_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/ip_whitelist/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @ip_whitelist_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/ip_whitelist/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @ip_whitelist_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::IPWhitelistEntry" do
      path = '/ip_whitelist/%{id}'
      replacements = {
        id: ip_whitelist_entry_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ip_whitelist_entry_result)
      result = @ip_whitelist_client.get(
        id: ip_whitelist_entry_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::IPWhitelistEntry)
      # expect(result.id).to eq(ip_whitelist_entry_result["id"])
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::IPWhitelistEntry" do
      path = '/ip_whitelist/%{id}'
      replacements = {
        id: ip_whitelist_entry_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ip_whitelist_entry_result)
      result = @ip_whitelist_client.get(
        id: ip_whitelist_entry_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::IPWhitelistEntry)
      # expect(result.id).to eq(ip_whitelist_entry_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(ip_whitelist_entry_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @ip_whitelist_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::IPWhitelistEntry" do
      path = '/ip_whitelist/%{id}'
      replacements = {
        id: ip_whitelist_entry_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ip_whitelist_entry_result)
      result = @ip_whitelist_client.update(
        id: ip_whitelist_entry_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::IPWhitelistEntry)
      # expect(result.id).to eq(ip_whitelist_entry_result["id"])
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::IPWhitelistEntry" do
      path = '/ip_whitelist/%{id}'
      replacements = {
        id: ip_whitelist_entry_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ip_whitelist_entry_result)
      result = @ip_whitelist_client.update(
        id: ip_whitelist_entry_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::IPWhitelistEntry)
      # expect(result.id).to eq(ip_whitelist_entry_result["id"])
    end
  end
end
