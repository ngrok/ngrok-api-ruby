require 'spec_helper'

RSpec.describe NgrokAPI::Services::EventSubscriptionsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/event_subscriptions' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: event_subscription_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @event_subscriptions_client = NgrokAPI::Services::EventSubscriptionsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::EventSubscription" do
      path = '/event_subscriptions'
      replacements = {
      }
      data = {}
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:sources] = "New sources"
      data[:destination_ids] = "New destination_ids"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(event_subscription_result)
      result = @event_subscriptions_client.create(
        metadata: "New metadata",
        description: "New description",
        sources: "New sources",
        destination_ids: "New destination_ids"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSubscription)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::EventSubscription" do
      path = '/event_subscriptions'
      replacements = {
      }
      data = {}
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:sources] = "New sources"
      data[:destination_ids] = "New destination_ids"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(event_subscription_result)
      result = @event_subscriptions_client.create(
        metadata: "New metadata",
        description: "New description",
        sources: "New sources",
        destination_ids: "New destination_ids"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSubscription)
      # expect(result.id).to eq(event_subscription_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/event_subscriptions/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @event_subscriptions_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/event_subscriptions/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @event_subscriptions_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/event_subscriptions/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @event_subscriptions_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::EventSubscription" do
      path = '/event_subscriptions/%{id}'
      replacements = {
        id: event_subscription_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(event_subscription_result)
      result = @event_subscriptions_client.get(
        id: event_subscription_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSubscription)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::EventSubscription" do
      path = '/event_subscriptions/%{id}'
      replacements = {
        id: event_subscription_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(event_subscription_result)
      result = @event_subscriptions_client.get(
        id: event_subscription_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSubscription)
      # expect(result.id).to eq(event_subscription_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(event_subscription_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @event_subscriptions_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::EventSubscription" do
      path = '/event_subscriptions/%{id}'
      replacements = {
        id: event_subscription_result["id"],
      }
      data = {}
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:sources] = "New sources"
      data[:destination_ids] = "New destination_ids"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(event_subscription_result)
      result = @event_subscriptions_client.update(
        id: event_subscription_result["id"],
        metadata: "New metadata",
        description: "New description",
        sources: "New sources",
        destination_ids: "New destination_ids"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSubscription)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::EventSubscription" do
      path = '/event_subscriptions/%{id}'
      replacements = {
        id: event_subscription_result["id"],
      }
      data = {}
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:sources] = "New sources"
      data[:destination_ids] = "New destination_ids"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(event_subscription_result)
      result = @event_subscriptions_client.update(
        id: event_subscription_result["id"],
        metadata: "New metadata",
        description: "New description",
        sources: "New sources",
        destination_ids: "New destination_ids"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSubscription)
      # expect(result.id).to eq(event_subscription_result["id"])
    end
  end
end
