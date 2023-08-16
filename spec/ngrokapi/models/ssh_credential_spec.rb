# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::SSHCredential do
  before(:each) do
    @client = class_double("SSHCredentialsClient")
    @ssh_credential = NgrokAPI::Models::SSHCredential.new(client: @client, attrs: ssh_credential_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::SSHCredential.new(client: @client, attrs: ssh_credential_result)
      expect(@ssh_credential == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@ssh_credential.to_s).to eq ssh_credential_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@ssh_credential.client).to receive(:delete)
      @ssh_credential.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_acl = 'New acl'
      expect(@ssh_credential.client).to receive(:update)
      @ssh_credential.update(
        description: new_description,
        metadata: new_metadata,
        acl: new_acl
      )
      expect(@ssh_credential.description).to eq new_description
      expect(@ssh_credential.metadata).to eq new_metadata
      expect(@ssh_credential.acl).to eq new_acl
    end
  end
end
