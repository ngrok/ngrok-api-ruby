require 'spec_helper'

RSpec.describe NgrokAPI::Models::ReservedDomain do
  before(:each) do
    @client = class_double("ReservedDomainsClient")
    @reserved_domain = NgrokAPI::Models::ReservedDomain.new(client: @client, attrs: reserved_domain_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::ReservedDomain.new(client: @client, attrs: reserved_domain_result)
      expect(@reserved_domain == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@reserved_domain.to_s).to eq reserved_domain_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@reserved_domain.client).to receive(:delete)
      @reserved_domain.delete
    end
  end
end
