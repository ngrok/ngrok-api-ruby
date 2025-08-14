# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::Vault do
  before(:each) do
    @client = class_double("VaultsClient")
    @vault = NgrokAPI::Models::Vault.new(client: @client, attrs: vault_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::Vault.new(client: @client, attrs: vault_result)
      expect(@vault == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@vault.to_s).to eq vault_result.to_s
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_name = 'New name'
      new_metadata = 'New metadata'
      new_description = 'New description'
      expect(@vault.client).to receive(:update)
      @vault.update(
        name: new_name,
        metadata: new_metadata,
        description: new_description
      )
      expect(@vault.name).to eq new_name
      expect(@vault.metadata).to eq new_metadata
      expect(@vault.description).to eq new_description
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@vault.client).to receive(:delete)
      @vault.delete
    end
  end
end
