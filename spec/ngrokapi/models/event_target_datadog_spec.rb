# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventTargetDatadog do
  before(:each) do
    @client = class_double("EventTargetDatadogsClient")
    @event_target_datadog = NgrokAPI::Models::EventTargetDatadog.new(client: @client, attrs: event_target_datadog_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventTargetDatadog.new(client: @client, attrs: event_target_datadog_result)
      expect(@event_target_datadog == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_target_datadog.to_s).to eq event_target_datadog_result.to_s
    end
  end
end
