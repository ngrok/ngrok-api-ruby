require 'spec_helper'

RSpec.describe NgrokAPI::Models::Tunnel do
  before(:each) do
    @client = class_double("TunnelsClient")
    @tunnel = NgrokAPI::Models::Tunnel.new(client: @client, result: tunnel_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::Tunnel.new(client: @client, result: tunnel_result)
      expect(@tunnel == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@tunnel.to_s).to eq tunnel_result.to_s
    end
  end
end
