# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventSourceList do
  before(:each) do
    @client = class_double("EventSourceListsClient")
    @event_source_list = NgrokAPI::Models::EventSourceList.new(client: @client, attrs: event_source_list_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventSourceList.new(client: @client, attrs: event_source_list_result)
      expect(@event_source_list == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_source_list.to_s).to eq event_source_list_result.to_s
    end
  end
end
