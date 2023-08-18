# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventTargetCloudwatchLogs do
  before(:each) do
    @client = class_double("EventTargetCloudwatchLogssClient")
    @event_target_cloudwatch_logs = NgrokAPI::Models::EventTargetCloudwatchLogs.new(client: @client, attrs: event_target_cloudwatch_logs_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventTargetCloudwatchLogs.new(client: @client, attrs: event_target_cloudwatch_logs_result)
      expect(@event_target_cloudwatch_logs == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_target_cloudwatch_logs.to_s).to eq event_target_cloudwatch_logs_result.to_s
    end
  end
end
