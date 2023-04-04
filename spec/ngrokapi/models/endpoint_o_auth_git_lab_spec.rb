require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointOAuthGitLab do
  before(:each) do
    @client = class_double("EndpointOAuthGitLabsClient")
    @endpoint_o_auth_git_lab = NgrokAPI::Models::EndpointOAuthGitLab.new(client: @client, attrs: endpoint_o_auth_git_lab_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointOAuthGitLab.new(client: @client, attrs: endpoint_o_auth_git_lab_result)
      expect(@endpoint_o_auth_git_lab == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_o_auth_git_lab.to_s).to eq endpoint_o_auth_git_lab_result.to_s
    end
  end
end
