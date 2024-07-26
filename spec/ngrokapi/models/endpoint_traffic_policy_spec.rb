# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointTrafficPolicy do
  before(:each) do
    @client = class_double("EndpointTrafficPolicysClient")
    @endpoint_traffic_policy = NgrokAPI::Models::EndpointTrafficPolicy.new(client: @client, attrs: endpoint_traffic_policy_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointTrafficPolicy.new(client: @client, attrs: endpoint_traffic_policy_result)
      expect(@endpoint_traffic_policy == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_traffic_policy.to_s).to eq endpoint_traffic_policy_result.to_s
    end
  end
end
