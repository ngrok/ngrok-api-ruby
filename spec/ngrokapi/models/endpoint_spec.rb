# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::Endpoint do
  before(:each) do
    @client = class_double("EndpointsClient")
    @endpoint = NgrokAPI::Models::Endpoint.new(client: @client, attrs: endpoint_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::Endpoint.new(client: @client, attrs: endpoint_result)
      expect(@endpoint == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint.to_s).to eq endpoint_result.to_s
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_url = 'New url'
      new_traffic_policy = 'New traffic_policy'
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_bindings = 'New bindings'
      new_pooling_enabled = 'New pooling_enabled'
      expect(@endpoint.client).to receive(:update)
      @endpoint.update(
        url: new_url,
        traffic_policy: new_traffic_policy,
        description: new_description,
        metadata: new_metadata,
        bindings: new_bindings,
        pooling_enabled: new_pooling_enabled
      )
      expect(@endpoint.url).to eq new_url
      expect(@endpoint.traffic_policy).to eq new_traffic_policy
      expect(@endpoint.description).to eq new_description
      expect(@endpoint.metadata).to eq new_metadata
      expect(@endpoint.bindings).to eq new_bindings
      expect(@endpoint.pooling_enabled).to eq new_pooling_enabled
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@endpoint.client).to receive(:delete)
      @endpoint.delete
    end
  end
end
