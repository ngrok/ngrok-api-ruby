require 'spec_helper'

RSpec.describe NgrokAPI::Models::IPRestriction do
  before(:each) do
    @client = class_double("IPRestrictionsClient")
    @ip_restriction = NgrokAPI::Models::IPRestriction.new(client: @client, result: ip_restriction_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::IPRestriction.new(client: @client, result: ip_restriction_result)
      expect(@ip_restriction == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@ip_restriction.to_s).to eq ip_restriction_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@ip_restriction.client).to receive(:delete)
      @ip_restriction.delete
    end
  end
end
