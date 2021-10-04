require 'spec_helper'

RSpec.describe NgrokAPI::Models::ReservedDomainCertStatus do
  before(:each) do
    @client = class_double("ReservedDomainCertStatussClient")
    @reserved_domain_cert_status = NgrokAPI::Models::ReservedDomainCertStatus.new(client: @client, result: reserved_domain_cert_status_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::ReservedDomainCertStatus.new(client: @client, result: reserved_domain_cert_status_result)
      expect(@reserved_domain_cert_status == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@reserved_domain_cert_status.to_s).to eq reserved_domain_cert_status_result.to_s
    end
  end
end
