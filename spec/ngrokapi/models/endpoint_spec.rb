require 'spec_helper'

RSpec.describe NgrokAPI::Models::Endpoint do
  before(:each) do
    @client = class_double("EndpointsClient")
    @endpoint = NgrokAPI::Models::Endpoint.new(client: @client, attrs: endpoint_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::Endpoint.new(client: @client, attrs: endpoint_result)
      expect(@endpoint == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint.to_s).to eq endpoint_result.to_s
    end
  end
end
