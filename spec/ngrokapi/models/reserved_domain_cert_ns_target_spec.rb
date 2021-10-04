require 'spec_helper'

RSpec.describe NgrokAPI::Models::ReservedDomainCertNSTarget do
  before(:each) do
    @client = class_double("ReservedDomainCertNSTargetsClient")
    @reserved_domain_cert_ns_target = NgrokAPI::Models::ReservedDomainCertNSTarget.new(client: @client, result: reserved_domain_cert_ns_target_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::ReservedDomainCertNSTarget.new(client: @client, result: reserved_domain_cert_ns_target_result)
      expect(@reserved_domain_cert_ns_target == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@reserved_domain_cert_ns_target.to_s).to eq reserved_domain_cert_ns_target_result.to_s
    end
  end
end
