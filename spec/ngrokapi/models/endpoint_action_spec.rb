# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointAction do
  before(:each) do
    @client = class_double("EndpointActionsClient")
    @endpoint_action = NgrokAPI::Models::EndpointAction.new(client: @client, attrs: endpoint_action_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointAction.new(client: @client, attrs: endpoint_action_result)
      expect(@endpoint_action == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_action.to_s).to eq endpoint_action_result.to_s
    end
  end
end
