require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointOAuth do
  before(:each) do
    @client = class_double("EndpointOAuthsClient")
    @endpoint_o_auth = NgrokAPI::Models::EndpointOAuth.new(client: @client, result: endpoint_o_auth_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointOAuth.new(client: @client, result: endpoint_o_auth_result)
      expect(@endpoint_o_auth == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_o_auth.to_s).to eq endpoint_o_auth_result.to_s
    end
  end
end
