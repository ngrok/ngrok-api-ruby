# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventTargetFirehose do
  before(:each) do
    @client = class_double("EventTargetFirehosesClient")
    @event_target_firehose = NgrokAPI::Models::EventTargetFirehose.new(client: @client, attrs: event_target_firehose_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventTargetFirehose.new(client: @client, attrs: event_target_firehose_result)
      expect(@event_target_firehose == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_target_firehose.to_s).to eq event_target_firehose_result.to_s
    end
  end
end
