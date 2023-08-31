# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointRequestHeaders do
  before(:each) do
    @client = class_double("EndpointRequestHeaderssClient")
    @endpoint_request_headers = NgrokAPI::Models::EndpointRequestHeaders.new(client: @client, attrs: endpoint_request_headers_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointRequestHeaders.new(client: @client, attrs: endpoint_request_headers_result)
      expect(@endpoint_request_headers == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_request_headers.to_s).to eq endpoint_request_headers_result.to_s
    end
  end
end
