require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventTargetKinesis do
  before(:each) do
    @client = class_double("EventTargetKinesissClient")
    @event_target_kinesis = NgrokAPI::Models::EventTargetKinesis.new(client: @client, attrs: event_target_kinesis_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventTargetKinesis.new(client: @client, attrs: event_target_kinesis_result)
      expect(@event_target_kinesis == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_target_kinesis.to_s).to eq event_target_kinesis_result.to_s
    end
  end
end
