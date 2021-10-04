require 'spec_helper'

RSpec.describe NgrokAPI::Models::ReservedDomainCertJob do
  before(:each) do
    @client = class_double("ReservedDomainCertJobsClient")
    @reserved_domain_cert_job = NgrokAPI::Models::ReservedDomainCertJob.new(client: @client, result: reserved_domain_cert_job_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::ReservedDomainCertJob.new(client: @client, result: reserved_domain_cert_job_result)
      expect(@reserved_domain_cert_job == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@reserved_domain_cert_job.to_s).to eq reserved_domain_cert_job_result.to_s
    end
  end
end
