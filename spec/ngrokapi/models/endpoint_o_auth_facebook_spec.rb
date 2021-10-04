require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointOAuthFacebook do
  before(:each) do
    @client = class_double("EndpointOAuthFacebooksClient")
    @endpoint_o_auth_facebook = NgrokAPI::Models::EndpointOAuthFacebook.new(client: @client, result: endpoint_o_auth_facebook_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointOAuthFacebook.new(client: @client, result: endpoint_o_auth_facebook_result)
      expect(@endpoint_o_auth_facebook == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_o_auth_facebook.to_s).to eq endpoint_o_auth_facebook_result.to_s
    end
  end
end
