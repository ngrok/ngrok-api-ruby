# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointIPPolicy do
  before(:each) do
    @client = class_double("EndpointIPPolicysClient")
    @endpoint_ip_policy = NgrokAPI::Models::EndpointIPPolicy.new(client: @client, attrs: endpoint_ip_policy_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointIPPolicy.new(client: @client, attrs: endpoint_ip_policy_result)
      expect(@endpoint_ip_policy == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_ip_policy.to_s).to eq endpoint_ip_policy_result.to_s
    end
  end
end
