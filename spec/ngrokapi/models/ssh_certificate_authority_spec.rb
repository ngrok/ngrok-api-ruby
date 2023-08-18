# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::SSHCertificateAuthority do
  before(:each) do
    @client = class_double("SSHCertificateAuthoritysClient")
    @ssh_certificate_authority = NgrokAPI::Models::SSHCertificateAuthority.new(client: @client, attrs: ssh_certificate_authority_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::SSHCertificateAuthority.new(client: @client, attrs: ssh_certificate_authority_result)
      expect(@ssh_certificate_authority == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@ssh_certificate_authority.to_s).to eq ssh_certificate_authority_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@ssh_certificate_authority.client).to receive(:delete)
      @ssh_certificate_authority.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      expect(@ssh_certificate_authority.client).to receive(:update)
      @ssh_certificate_authority.update(
        description: new_description,
        metadata: new_metadata
      )
      expect(@ssh_certificate_authority.description).to eq new_description
      expect(@ssh_certificate_authority.metadata).to eq new_metadata
    end
  end
end
