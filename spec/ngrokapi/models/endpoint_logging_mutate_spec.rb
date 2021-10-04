require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointLoggingMutate do
  before(:each) do
    @client = class_double("EndpointLoggingMutatesClient")
    @endpoint_logging_mutate = NgrokAPI::Models::EndpointLoggingMutate.new(client: @client, result: endpoint_logging_mutate_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointLoggingMutate.new(client: @client, result: endpoint_logging_mutate_result)
      expect(@endpoint_logging_mutate == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_logging_mutate.to_s).to eq endpoint_logging_mutate_result.to_s
    end
  end
end
