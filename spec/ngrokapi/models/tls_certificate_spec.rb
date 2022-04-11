require 'spec_helper'

RSpec.describe NgrokAPI::Models::TLSCertificate do
  before(:each) do
    @client = class_double("TLSCertificatesClient")
    @tls_certificate = NgrokAPI::Models::TLSCertificate.new(client: @client, attrs: tls_certificate_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::TLSCertificate.new(client: @client, attrs: tls_certificate_result)
      expect(@tls_certificate == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@tls_certificate.to_s).to eq tls_certificate_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@tls_certificate.client).to receive(:delete)
      @tls_certificate.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      expect(@tls_certificate.client).to receive(:update)
      @tls_certificate.update(
        description: new_description,
        metadata: new_metadata
      )
      expect(@tls_certificate.description).to eq new_description
      expect(@tls_certificate.metadata).to eq new_metadata
    end
  end
end
