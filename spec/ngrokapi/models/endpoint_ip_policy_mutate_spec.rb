require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointIPPolicyMutate do
  before(:each) do
    @client = class_double("EndpointIPPolicyMutatesClient")
    @endpoint_ip_policy_mutate = NgrokAPI::Models::EndpointIPPolicyMutate.new(client: @client, attrs: endpoint_ip_policy_mutate_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointIPPolicyMutate.new(client: @client, attrs: endpoint_ip_policy_mutate_result)
      expect(@endpoint_ip_policy_mutate == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_ip_policy_mutate.to_s).to eq endpoint_ip_policy_mutate_result.to_s
    end
  end
end
