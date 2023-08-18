# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointOAuthTwitch do
  before(:each) do
    @client = class_double("EndpointOAuthTwitchsClient")
    @endpoint_o_auth_twitch = NgrokAPI::Models::EndpointOAuthTwitch.new(client: @client, attrs: endpoint_o_auth_twitch_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointOAuthTwitch.new(client: @client, attrs: endpoint_o_auth_twitch_result)
      expect(@endpoint_o_auth_twitch == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_o_auth_twitch.to_s).to eq endpoint_o_auth_twitch_result.to_s
    end
  end
end
