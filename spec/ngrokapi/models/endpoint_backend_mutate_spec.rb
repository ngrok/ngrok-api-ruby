require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointBackendMutate do
  before(:each) do
    @client = class_double("EndpointBackendMutatesClient")
    @endpoint_backend_mutate = NgrokAPI::Models::EndpointBackendMutate.new(client: @client, attrs: endpoint_backend_mutate_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointBackendMutate.new(client: @client, attrs: endpoint_backend_mutate_result)
      expect(@endpoint_backend_mutate == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_backend_mutate.to_s).to eq endpoint_backend_mutate_result.to_s
    end
  end
end
