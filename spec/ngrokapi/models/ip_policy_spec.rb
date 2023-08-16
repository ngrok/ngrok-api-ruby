# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::IPPolicy do
  before(:each) do
    @client = class_double("IPPolicysClient")
    @ip_policy = NgrokAPI::Models::IPPolicy.new(client: @client, attrs: ip_policy_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::IPPolicy.new(client: @client, attrs: ip_policy_result)
      expect(@ip_policy == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@ip_policy.to_s).to eq ip_policy_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@ip_policy.client).to receive(:delete)
      @ip_policy.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      expect(@ip_policy.client).to receive(:update)
      @ip_policy.update(
        description: new_description,
        metadata: new_metadata
      )
      expect(@ip_policy.description).to eq new_description
      expect(@ip_policy.metadata).to eq new_metadata
    end
  end
end
