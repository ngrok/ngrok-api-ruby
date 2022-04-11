require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointResponseHeaders do
  before(:each) do
    @client = class_double("EndpointResponseHeaderssClient")
    @endpoint_response_headers = NgrokAPI::Models::EndpointResponseHeaders.new(client: @client, attrs: endpoint_response_headers_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointResponseHeaders.new(client: @client, attrs: endpoint_response_headers_result)
      expect(@endpoint_response_headers == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_response_headers.to_s).to eq endpoint_response_headers_result.to_s
    end
  end
end
