# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::AgentIngressCertJob do
  before(:each) do
    @client = class_double("AgentIngressCertJobsClient")
    @agent_ingress_cert_job = NgrokAPI::Models::AgentIngressCertJob.new(client: @client, attrs: agent_ingress_cert_job_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::AgentIngressCertJob.new(client: @client, attrs: agent_ingress_cert_job_result)
      expect(@agent_ingress_cert_job == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@agent_ingress_cert_job.to_s).to eq agent_ingress_cert_job_result.to_s
    end
  end
end
