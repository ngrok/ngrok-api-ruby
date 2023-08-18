# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::CertificateAuthority do
  before(:each) do
    @client = class_double("CertificateAuthoritysClient")
    @certificate_authority = NgrokAPI::Models::CertificateAuthority.new(client: @client, attrs: certificate_authority_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::CertificateAuthority.new(client: @client, attrs: certificate_authority_result)
      expect(@certificate_authority == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@certificate_authority.to_s).to eq certificate_authority_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@certificate_authority.client).to receive(:delete)
      @certificate_authority.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      expect(@certificate_authority.client).to receive(:update)
      @certificate_authority.update(
        description: new_description,
        metadata: new_metadata
      )
      expect(@certificate_authority.description).to eq new_description
      expect(@certificate_authority.metadata).to eq new_metadata
    end
  end
end
