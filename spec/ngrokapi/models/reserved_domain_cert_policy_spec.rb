# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::ReservedDomainCertPolicy do
  before(:each) do
    @client = class_double("ReservedDomainCertPolicysClient")
    @reserved_domain_cert_policy = NgrokAPI::Models::ReservedDomainCertPolicy.new(client: @client, attrs: reserved_domain_cert_policy_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::ReservedDomainCertPolicy.new(client: @client, attrs: reserved_domain_cert_policy_result)
      expect(@reserved_domain_cert_policy == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@reserved_domain_cert_policy.to_s).to eq reserved_domain_cert_policy_result.to_s
    end
  end
end
