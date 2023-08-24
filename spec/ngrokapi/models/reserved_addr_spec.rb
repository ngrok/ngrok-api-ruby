# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::ReservedAddr do
  before(:each) do
    @client = class_double("ReservedAddrsClient")
    @reserved_addr = NgrokAPI::Models::ReservedAddr.new(client: @client, attrs: reserved_addr_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::ReservedAddr.new(client: @client, attrs: reserved_addr_result)
      expect(@reserved_addr == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@reserved_addr.to_s).to eq reserved_addr_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@reserved_addr.client).to receive(:delete)
      @reserved_addr.delete
    end
  end
end
