require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointOAuthMicrosoft do
  before(:each) do
    @client = class_double("EndpointOAuthMicrosoftsClient")
    @endpoint_o_auth_microsoft = NgrokAPI::Models::EndpointOAuthMicrosoft.new(client: @client, result: endpoint_o_auth_microsoft_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointOAuthMicrosoft.new(client: @client, result: endpoint_o_auth_microsoft_result)
      expect(@endpoint_o_auth_microsoft == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_o_auth_microsoft.to_s).to eq endpoint_o_auth_microsoft_result.to_s
    end
  end
end
