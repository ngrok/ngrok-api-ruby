# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::AgentIngressCertPolicy do
  before(:each) do
    @client = class_double("AgentIngressCertPolicysClient")
    @agent_ingress_cert_policy = NgrokAPI::Models::AgentIngressCertPolicy.new(client: @client, attrs: agent_ingress_cert_policy_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::AgentIngressCertPolicy.new(client: @client, attrs: agent_ingress_cert_policy_result)
      expect(@agent_ingress_cert_policy == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@agent_ingress_cert_policy.to_s).to eq agent_ingress_cert_policy_result.to_s
    end
  end
end
