# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::VaultsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/vaults' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: vault_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @vaults_client = NgrokAPI::Services::VaultsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::Vault" do
      path = '/vaults'
      replacements = {
      }
      data = {}
      data[:name] = "New name"
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(vault_result)
      result = @vaults_client.create(
        name: "New name",
        metadata: "New metadata",
        description: "New description"
      )
      expect(result.class).to eq(NgrokAPI::Models::Vault)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::Vault" do
      path = '/vaults'
      replacements = {
      }
      data = {}
      data[:name] = "New name"
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(vault_result)
      result = @vaults_client.create(
        name: "New name",
        metadata: "New metadata",
        description: "New description"
      )
      expect(result.class).to eq(NgrokAPI::Models::Vault)
      # expect(result.id).to eq(vault_result["id"])
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::Vault" do
      path = '/vaults/%{id}'
      replacements = {
        id: vault_result["id"],
      }
      data = {}
      data[:name] = "New name"
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(vault_result)
      result = @vaults_client.update(
        id: vault_result["id"],
        name: "New name",
        metadata: "New metadata",
        description: "New description"
      )
      expect(result.class).to eq(NgrokAPI::Models::Vault)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::Vault" do
      path = '/vaults/%{id}'
      replacements = {
        id: vault_result["id"],
      }
      data = {}
      data[:name] = "New name"
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(vault_result)
      result = @vaults_client.update(
        id: vault_result["id"],
        name: "New name",
        metadata: "New metadata",
        description: "New description"
      )
      expect(result.class).to eq(NgrokAPI::Models::Vault)
      # expect(result.id).to eq(vault_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/vaults/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @vaults_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/vaults/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @vaults_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/vaults/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @vaults_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::Vault" do
      path = '/vaults/%{id}'
      replacements = {
        id: vault_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(vault_result)
      result = @vaults_client.get(
        id: vault_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::Vault)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::Vault" do
      path = '/vaults/%{id}'
      replacements = {
        id: vault_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(vault_result)
      result = @vaults_client.get(
        id: vault_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::Vault)
      # expect(result.id).to eq(vault_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(vault_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @vaults_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end
end
