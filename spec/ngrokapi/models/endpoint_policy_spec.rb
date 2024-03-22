# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointPolicy do
  before(:each) do
    @client = class_double("EndpointPolicysClient")
    @endpoint_policy = NgrokAPI::Models::EndpointPolicy.new(client: @client, attrs: endpoint_policy_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointPolicy.new(client: @client, attrs: endpoint_policy_result)
      expect(@endpoint_policy == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_policy.to_s).to eq endpoint_policy_result.to_s
    end
  end
end
