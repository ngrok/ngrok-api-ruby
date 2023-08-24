# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointBackend do
  before(:each) do
    @client = class_double("EndpointBackendsClient")
    @endpoint_backend = NgrokAPI::Models::EndpointBackend.new(client: @client, attrs: endpoint_backend_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointBackend.new(client: @client, attrs: endpoint_backend_result)
      expect(@endpoint_backend == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_backend.to_s).to eq endpoint_backend_result.to_s
    end
  end
end
