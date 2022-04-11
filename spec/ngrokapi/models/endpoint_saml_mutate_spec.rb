require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointSAMLMutate do
  before(:each) do
    @client = class_double("EndpointSAMLMutatesClient")
    @endpoint_saml_mutate = NgrokAPI::Models::EndpointSAMLMutate.new(client: @client, attrs: endpoint_saml_mutate_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointSAMLMutate.new(client: @client, attrs: endpoint_saml_mutate_result)
      expect(@endpoint_saml_mutate == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_saml_mutate.to_s).to eq endpoint_saml_mutate_result.to_s
    end
  end
end
