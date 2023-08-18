# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::SSHUserCertificate do
  before(:each) do
    @client = class_double("SSHUserCertificatesClient")
    @ssh_user_certificate = NgrokAPI::Models::SSHUserCertificate.new(client: @client, attrs: ssh_user_certificate_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::SSHUserCertificate.new(client: @client, attrs: ssh_user_certificate_result)
      expect(@ssh_user_certificate == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@ssh_user_certificate.to_s).to eq ssh_user_certificate_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@ssh_user_certificate.client).to receive(:delete)
      @ssh_user_certificate.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      expect(@ssh_user_certificate.client).to receive(:update)
      @ssh_user_certificate.update(
        description: new_description,
        metadata: new_metadata
      )
      expect(@ssh_user_certificate.description).to eq new_description
      expect(@ssh_user_certificate.metadata).to eq new_metadata
    end
  end
end
