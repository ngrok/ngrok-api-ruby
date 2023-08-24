# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointCompression do
  before(:each) do
    @client = class_double("EndpointCompressionsClient")
    @endpoint_compression = NgrokAPI::Models::EndpointCompression.new(client: @client, attrs: endpoint_compression_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointCompression.new(client: @client, attrs: endpoint_compression_result)
      expect(@endpoint_compression == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_compression.to_s).to eq endpoint_compression_result.to_s
    end
  end
end
