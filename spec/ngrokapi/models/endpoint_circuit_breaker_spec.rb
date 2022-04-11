require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointCircuitBreaker do
  before(:each) do
    @client = class_double("EndpointCircuitBreakersClient")
    @endpoint_circuit_breaker = NgrokAPI::Models::EndpointCircuitBreaker.new(client: @client, attrs: endpoint_circuit_breaker_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointCircuitBreaker.new(client: @client, attrs: endpoint_circuit_breaker_result)
      expect(@endpoint_circuit_breaker == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_circuit_breaker.to_s).to eq endpoint_circuit_breaker_result.to_s
    end
  end
end
