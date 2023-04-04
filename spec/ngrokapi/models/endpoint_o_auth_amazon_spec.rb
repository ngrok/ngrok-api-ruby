require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointOAuthAmazon do
  before(:each) do
    @client = class_double("EndpointOAuthAmazonsClient")
    @endpoint_o_auth_amazon = NgrokAPI::Models::EndpointOAuthAmazon.new(client: @client, attrs: endpoint_o_auth_amazon_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointOAuthAmazon.new(client: @client, attrs: endpoint_o_auth_amazon_result)
      expect(@endpoint_o_auth_amazon == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_o_auth_amazon.to_s).to eq endpoint_o_auth_amazon_result.to_s
    end
  end
end
