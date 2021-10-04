require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointOIDC do
  before(:each) do
    @client = class_double("EndpointOIDCsClient")
    @endpoint_oidc = NgrokAPI::Models::EndpointOIDC.new(client: @client, result: endpoint_oidc_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointOIDC.new(client: @client, result: endpoint_oidc_result)
      expect(@endpoint_oidc == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_oidc.to_s).to eq endpoint_oidc_result.to_s
    end
  end
end
