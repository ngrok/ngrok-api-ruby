# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::AgentIngressCertStatus do
  before(:each) do
    @client = class_double("AgentIngressCertStatussClient")
    @agent_ingress_cert_status = NgrokAPI::Models::AgentIngressCertStatus.new(client: @client, attrs: agent_ingress_cert_status_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::AgentIngressCertStatus.new(client: @client, attrs: agent_ingress_cert_status_result)
      expect(@agent_ingress_cert_status == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@agent_ingress_cert_status.to_s).to eq agent_ingress_cert_status_result.to_s
    end
  end
end
