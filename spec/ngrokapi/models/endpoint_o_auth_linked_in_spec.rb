require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointOAuthLinkedIn do
  before(:each) do
    @client = class_double("EndpointOAuthLinkedInsClient")
    @endpoint_o_auth_linked_in = NgrokAPI::Models::EndpointOAuthLinkedIn.new(client: @client, attrs: endpoint_o_auth_linked_in_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointOAuthLinkedIn.new(client: @client, attrs: endpoint_o_auth_linked_in_result)
      expect(@endpoint_o_auth_linked_in == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_o_auth_linked_in.to_s).to eq endpoint_o_auth_linked_in_result.to_s
    end
  end
end
