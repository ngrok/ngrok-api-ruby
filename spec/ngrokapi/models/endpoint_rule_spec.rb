# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointRule do
  before(:each) do
    @client = class_double("EndpointRulesClient")
    @endpoint_rule = NgrokAPI::Models::EndpointRule.new(client: @client, attrs: endpoint_rule_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointRule.new(client: @client, attrs: endpoint_rule_result)
      expect(@endpoint_rule == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_rule.to_s).to eq endpoint_rule_result.to_s
    end
  end
end
