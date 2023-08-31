# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::TLSCertificateSANs do
  before(:each) do
    @client = class_double("TLSCertificateSANssClient")
    @tls_certificate_sa_ns = NgrokAPI::Models::TLSCertificateSANs.new(client: @client, attrs: tls_certificate_sa_ns_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::TLSCertificateSANs.new(client: @client, attrs: tls_certificate_sa_ns_result)
      expect(@tls_certificate_sa_ns == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@tls_certificate_sa_ns.to_s).to eq tls_certificate_sa_ns_result.to_s
    end
  end
end
