# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointUserAgentFilter do
  before(:each) do
    @client = class_double("EndpointUserAgentFiltersClient")
    @endpoint_user_agent_filter = NgrokAPI::Models::EndpointUserAgentFilter.new(client: @client, attrs: endpoint_user_agent_filter_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointUserAgentFilter.new(client: @client, attrs: endpoint_user_agent_filter_result)
      expect(@endpoint_user_agent_filter == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_user_agent_filter.to_s).to eq endpoint_user_agent_filter_result.to_s
    end
  end
end
