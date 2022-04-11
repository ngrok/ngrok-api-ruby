require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointSAML do
  before(:each) do
    @client = class_double("EndpointSAMLsClient")
    @endpoint_saml = NgrokAPI::Models::EndpointSAML.new(client: @client, attrs: endpoint_saml_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointSAML.new(client: @client, attrs: endpoint_saml_result)
      expect(@endpoint_saml == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_saml.to_s).to eq endpoint_saml_result.to_s
    end
  end
end
