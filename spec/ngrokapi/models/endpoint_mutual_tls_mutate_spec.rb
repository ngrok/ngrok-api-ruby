# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointMutualTLSMutate do
  before(:each) do
    @client = class_double("EndpointMutualTLSMutatesClient")
    @endpoint_mutual_tls_mutate = NgrokAPI::Models::EndpointMutualTLSMutate.new(client: @client, attrs: endpoint_mutual_tls_mutate_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointMutualTLSMutate.new(client: @client, attrs: endpoint_mutual_tls_mutate_result)
      expect(@endpoint_mutual_tls_mutate == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_mutual_tls_mutate.to_s).to eq endpoint_mutual_tls_mutate_result.to_s
    end
  end
end
