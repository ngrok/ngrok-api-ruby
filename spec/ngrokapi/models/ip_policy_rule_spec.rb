require 'spec_helper'

RSpec.describe NgrokAPI::Models::IPPolicyRule do
  before(:each) do
    @client = class_double("IPPolicyRulesClient")
    @ip_policy_rule = NgrokAPI::Models::IPPolicyRule.new(client: @client, result: ip_policy_rule_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::IPPolicyRule.new(client: @client, result: ip_policy_rule_result)
      expect(@ip_policy_rule == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@ip_policy_rule.to_s).to eq ip_policy_rule_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@ip_policy_rule.client).to receive(:delete)
      @ip_policy_rule.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_cidr = 'New cidr'
      expect(@ip_policy_rule.client).to receive(:update)
      @ip_policy_rule.update(
        description: new_description,
        metadata: new_metadata,
        cidr: new_cidr
      )
      expect(@ip_policy_rule.description).to eq new_description
      expect(@ip_policy_rule.metadata).to eq new_metadata
      expect(@ip_policy_rule.cidr).to eq new_cidr
    end
  end
end
