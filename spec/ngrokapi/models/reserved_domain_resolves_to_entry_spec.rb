# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::ReservedDomainResolvesToEntry do
  before(:each) do
    @client = class_double("ReservedDomainResolvesToEntrysClient")
    @reserved_domain_resolves_to_entry = NgrokAPI::Models::ReservedDomainResolvesToEntry.new(client: @client, attrs: reserved_domain_resolves_to_entry_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::ReservedDomainResolvesToEntry.new(client: @client, attrs: reserved_domain_resolves_to_entry_result)
      expect(@reserved_domain_resolves_to_entry == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@reserved_domain_resolves_to_entry.to_s).to eq reserved_domain_resolves_to_entry_result.to_s
    end
  end
end
