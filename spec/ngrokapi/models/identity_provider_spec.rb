require 'spec_helper'

RSpec.describe NgrokAPI::Models::IdentityProvider do
  before(:each) do
    @client = class_double("IdentityProvidersClient")
    @identity_provider = NgrokAPI::Models::IdentityProvider.new(client: @client, attrs: identity_provider_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::IdentityProvider.new(client: @client, attrs: identity_provider_result)
      expect(@identity_provider == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@identity_provider.to_s).to eq identity_provider_result.to_s
    end
  end
end
