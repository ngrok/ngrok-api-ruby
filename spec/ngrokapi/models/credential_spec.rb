# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::Credential do
  before(:each) do
    @client = class_double("CredentialsClient")
    @credential = NgrokAPI::Models::Credential.new(client: @client, attrs: credential_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::Credential.new(client: @client, attrs: credential_result)
      expect(@credential == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@credential.to_s).to eq credential_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@credential.client).to receive(:delete)
      @credential.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_acl = 'New acl'
      expect(@credential.client).to receive(:update)
      @credential.update(
        description: new_description,
        metadata: new_metadata,
        acl: new_acl
      )
      expect(@credential.description).to eq new_description
      expect(@credential.metadata).to eq new_metadata
      expect(@credential.acl).to eq new_acl
    end
  end
end
