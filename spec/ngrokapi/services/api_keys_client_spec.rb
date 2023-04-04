require 'spec_helper'

RSpec.describe NgrokAPI::Services::APIKeysClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/api_keys' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: api_key_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @api_keys_client = NgrokAPI::Services::APIKeysClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::APIKey" do
      path = '/api_keys'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:owner_id] = "New owner_id"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(api_key_result)
      result = @api_keys_client.create(
        description: "New description",
        metadata: "New metadata",
        owner_id: "New owner_id",
        owner_email: "New owner_email"
      )
      expect(result.class).to eq(NgrokAPI::Models::APIKey)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::APIKey" do
      path = '/api_keys'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:owner_id] = "New owner_id"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(api_key_result)
      result = @api_keys_client.create(
        description: "New description",
        metadata: "New metadata",
        owner_id: "New owner_id",
        owner_email: "New owner_email"
      )
      expect(result.class).to eq(NgrokAPI::Models::APIKey)
      # expect(result.id).to eq(api_key_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/api_keys/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @api_keys_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/api_keys/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @api_keys_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/api_keys/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @api_keys_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::APIKey" do
      path = '/api_keys/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(api_key_result)
      result = @api_keys_client.get(
        id: api_key_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::APIKey)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::APIKey" do
      path = '/api_keys/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(api_key_result)
      result = @api_keys_client.get(
        id: api_key_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::APIKey)
      # expect(result.id).to eq(api_key_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(api_key_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @api_keys_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::APIKey" do
      path = '/api_keys/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(api_key_result)
      result = @api_keys_client.update(
        id: api_key_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::APIKey)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::APIKey" do
      path = '/api_keys/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(api_key_result)
      result = @api_keys_client.update(
        id: api_key_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::APIKey)
      # expect(result.id).to eq(api_key_result["id"])
    end
  end
end
