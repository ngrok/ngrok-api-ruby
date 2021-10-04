require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointMutualTLS do
  before(:each) do
    @client = class_double("EndpointMutualTLSsClient")
    @endpoint_mutual_tls = NgrokAPI::Models::EndpointMutualTLS.new(client: @client, result: endpoint_mutual_tls_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointMutualTLS.new(client: @client, result: endpoint_mutual_tls_result)
      expect(@endpoint_mutual_tls == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_mutual_tls.to_s).to eq endpoint_mutual_tls_result.to_s
    end
  end
end
