require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointLogging do
  before(:each) do
    @client = class_double("EndpointLoggingsClient")
    @endpoint_logging = NgrokAPI::Models::EndpointLogging.new(client: @client, result: endpoint_logging_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointLogging.new(client: @client, result: endpoint_logging_result)
      expect(@endpoint_logging == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_logging.to_s).to eq endpoint_logging_result.to_s
    end
  end
end
