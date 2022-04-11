require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventSubscription do
  before(:each) do
    @client = class_double("EventSubscriptionsClient")
    @event_subscription = NgrokAPI::Models::EventSubscription.new(client: @client, attrs: event_subscription_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventSubscription.new(client: @client, attrs: event_subscription_result)
      expect(@event_subscription == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_subscription.to_s).to eq event_subscription_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@event_subscription.client).to receive(:delete)
      @event_subscription.delete
    end
  end
end
