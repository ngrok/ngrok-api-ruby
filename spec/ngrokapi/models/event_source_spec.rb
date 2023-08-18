# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventSource do
  before(:each) do
    @client = class_double("EventSourcesClient")
    @event_source = NgrokAPI::Models::EventSource.new(client: @client, attrs: event_source_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventSource.new(client: @client, attrs: event_source_result)
      expect(@event_source == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_source.to_s).to eq event_source_result.to_s
    end
  end
end
