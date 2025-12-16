# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::SecretsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/vault_secrets' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: secret_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @secrets_client = NgrokAPI::Services::SecretsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::Secret" do
      path = '/vault_secrets'
      replacements = {
      }
      data = {}
      data[:name] = "New name"
      data[:value] = "New value"
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:vault_id] = "New vault_id"
      data[:vault_name] = "New vault_name"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(secret_result)
      result = @secrets_client.create(
        name: "New name",
        value: "New value",
        metadata: "New metadata",
        description: "New description",
        vault_id: "New vault_id",
        vault_name: "New vault_name"
      )
      expect(result.class).to eq(NgrokAPI::Models::Secret)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::Secret" do
      path = '/vault_secrets'
      replacements = {
      }
      data = {}
      data[:name] = "New name"
      data[:value] = "New value"
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:vault_id] = "New vault_id"
      data[:vault_name] = "New vault_name"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(secret_result)
      result = @secrets_client.create(
        name: "New name",
        value: "New value",
        metadata: "New metadata",
        description: "New description",
        vault_id: "New vault_id",
        vault_name: "New vault_name"
      )
      expect(result.class).to eq(NgrokAPI::Models::Secret)
      # expect(result.id).to eq(secret_result["id"])
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::Secret" do
      path = '/vault_secrets/%{id}'
      replacements = {
        id: secret_result["id"],
      }
      data = {}
      data[:name] = "New name"
      data[:value] = "New value"
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(secret_result)
      result = @secrets_client.update(
        id: secret_result["id"],
        name: "New name",
        value: "New value",
        metadata: "New metadata",
        description: "New description"
      )
      expect(result.class).to eq(NgrokAPI::Models::Secret)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::Secret" do
      path = '/vault_secrets/%{id}'
      replacements = {
        id: secret_result["id"],
      }
      data = {}
      data[:name] = "New name"
      data[:value] = "New value"
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(secret_result)
      result = @secrets_client.update(
        id: secret_result["id"],
        name: "New name",
        value: "New value",
        metadata: "New metadata",
        description: "New description"
      )
      expect(result.class).to eq(NgrokAPI::Models::Secret)
      # expect(result.id).to eq(secret_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/vault_secrets/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @secrets_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/vault_secrets/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @secrets_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/vault_secrets/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @secrets_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::Secret" do
      path = '/vault_secrets/%{id}'
      replacements = {
        id: secret_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(secret_result)
      result = @secrets_client.get(
        id: secret_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::Secret)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::Secret" do
      path = '/vault_secrets/%{id}'
      replacements = {
        id: secret_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(secret_result)
      result = @secrets_client.get(
        id: secret_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::Secret)
      # expect(result.id).to eq(secret_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(secret_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @secrets_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end
end
