# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointTLSTermination do
  before(:each) do
    @client = class_double("EndpointTLSTerminationsClient")
    @endpoint_tls_termination = NgrokAPI::Models::EndpointTLSTermination.new(client: @client, attrs: endpoint_tls_termination_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointTLSTermination.new(client: @client, attrs: endpoint_tls_termination_result)
      expect(@endpoint_tls_termination == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_tls_termination.to_s).to eq endpoint_tls_termination_result.to_s
    end
  end
end
