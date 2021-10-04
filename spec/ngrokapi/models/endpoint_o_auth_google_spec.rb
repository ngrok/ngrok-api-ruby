require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointOAuthGoogle do
  before(:each) do
    @client = class_double("EndpointOAuthGooglesClient")
    @endpoint_o_auth_google = NgrokAPI::Models::EndpointOAuthGoogle.new(client: @client, result: endpoint_o_auth_google_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointOAuthGoogle.new(client: @client, result: endpoint_o_auth_google_result)
      expect(@endpoint_o_auth_google == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_o_auth_google.to_s).to eq endpoint_o_auth_google_result.to_s
    end
  end
end
