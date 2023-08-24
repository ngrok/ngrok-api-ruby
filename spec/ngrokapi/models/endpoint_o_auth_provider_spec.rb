# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointOAuthProvider do
  before(:each) do
    @client = class_double("EndpointOAuthProvidersClient")
    @endpoint_o_auth_provider = NgrokAPI::Models::EndpointOAuthProvider.new(client: @client, attrs: endpoint_o_auth_provider_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointOAuthProvider.new(client: @client, attrs: endpoint_o_auth_provider_result)
      expect(@endpoint_o_auth_provider == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_o_auth_provider.to_s).to eq endpoint_o_auth_provider_result.to_s
    end
  end
end
