require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointTLSTerminationAtEdge do
  before(:each) do
    @client = class_double("EndpointTLSTerminationAtEdgesClient")
    @endpoint_tls_termination_at_edge = NgrokAPI::Models::EndpointTLSTerminationAtEdge.new(client: @client, attrs: endpoint_tls_termination_at_edge_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointTLSTerminationAtEdge.new(client: @client, attrs: endpoint_tls_termination_at_edge_result)
      expect(@endpoint_tls_termination_at_edge == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_tls_termination_at_edge.to_s).to eq endpoint_tls_termination_at_edge_result.to_s
    end
  end
end
