require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventSourceReplace do
  before(:each) do
    @client = class_double("EventSourceReplacesClient")
    @event_source_replace = NgrokAPI::Models::EventSourceReplace.new(client: @client, result: event_source_replace_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventSourceReplace.new(client: @client, result: event_source_replace_result)
      expect(@event_source_replace == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_source_replace.to_s).to eq event_source_replace_result.to_s
    end
  end
end
