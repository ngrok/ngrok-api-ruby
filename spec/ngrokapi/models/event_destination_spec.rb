require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventDestination do
  before(:each) do
    @client = class_double("EventDestinationsClient")
    @event_destination = NgrokAPI::Models::EventDestination.new(client: @client, result: event_destination_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventDestination.new(client: @client, result: event_destination_result)
      expect(@event_destination == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_destination.to_s).to eq event_destination_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@event_destination.client).to receive(:delete)
      @event_destination.delete
    end
  end
end
