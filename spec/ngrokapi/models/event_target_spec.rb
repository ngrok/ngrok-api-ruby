require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventTarget do
  before(:each) do
    @client = class_double("EventTargetsClient")
    @event_target = NgrokAPI::Models::EventTarget.new(client: @client, result: event_target_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventTarget.new(client: @client, result: event_target_result)
      expect(@event_target == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_target.to_s).to eq event_target_result.to_s
    end
  end
end
