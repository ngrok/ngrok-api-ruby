# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointOAuthGitHub do
  before(:each) do
    @client = class_double("EndpointOAuthGitHubsClient")
    @endpoint_o_auth_git_hub = NgrokAPI::Models::EndpointOAuthGitHub.new(client: @client, attrs: endpoint_o_auth_git_hub_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointOAuthGitHub.new(client: @client, attrs: endpoint_o_auth_git_hub_result)
      expect(@endpoint_o_auth_git_hub == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_o_auth_git_hub.to_s).to eq endpoint_o_auth_git_hub_result.to_s
    end
  end
end
