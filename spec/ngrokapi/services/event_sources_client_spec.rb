require 'spec_helper'

RSpec.describe NgrokAPI::Services::EventSourcesClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/event_subscriptions/%{subscription_id}/sources' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: event_source_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @event_sources_client = NgrokAPI::Services::EventSourcesClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::EventSource" do
      path = '/event_subscriptions/%{subscription_id}/sources'
      replacements = {
        subscription_id: event_source_result["subscription_id"],
      }
      data = {}
      data[:type] = "New type"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(event_source_result)
      result = @event_sources_client.create(
        subscription_id: event_source_result["subscription_id"],
        type: "New type",
        filter: "New filter",
        fields: "New fields"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSource)
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
      replacements = {
        subscription_id: api_key_result["subscription_id"],
        type: api_key_result["type"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @event_sources_client.delete(
        subscription_id: api_key_result["subscription_id"],
        type: api_key_result["type"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
      replacements = {
        subscription_id: api_key_result["subscription_id"],
        type: api_key_result["type"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @event_sources_client.delete!(
        subscription_id: api_key_result["subscription_id"],
        type: api_key_result["type"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
      replacements = {
        subscription_id: api_key_result["subscription_id"],
        type: api_key_result["type"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @event_sources_client.delete!(
          subscription_id: api_key_result["subscription_id"],
          type: api_key_result["type"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::EventSource" do
      path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
      replacements = {
        subscription_id: event_source_result["subscription_id"],
        type: event_source_result["type"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(event_source_result)
      result = @event_sources_client.get(
        subscription_id: event_source_result["subscription_id"],
        type: event_source_result["type"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSource)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::EventSource" do
      path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
      replacements = {
        subscription_id: event_source_result["subscription_id"],
        type: event_source_result["type"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(event_source_result)
      result = @event_sources_client.get(
        subscription_id: event_source_result["subscription_id"],
        type: event_source_result["type"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSource)
      # expect(result.id).to eq(event_source_result["id"])
    end
  end

  describe "#list" do
    it "will make a get request and return an instance of NgrokAPI::Models::EventSourceList" do
      path = '/event_subscriptions/%{subscription_id}/sources'
      replacements = {
        subscription_id: event_source_list_result["subscription_id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(event_source_list_result)
      result = @event_sources_client.list(
        subscription_id: event_source_list_result["subscription_id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSourceList)
    end
  end

  describe "#list!" do
    it "will make a get request and return an instance of NgrokAPI::Models::EventSourceList" do
      path = '/event_subscriptions/%{subscription_id}/sources'
      replacements = {
        subscription_id: event_source_list_result["subscription_id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(event_source_list_result)
      result = @event_sources_client.list(
        subscription_id: event_source_list_result["subscription_id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSourceList)
      # expect(result.id).to eq(event_source_list_result["id"])
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::EventSource" do
      path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
      replacements = {
        subscription_id: event_source_result["subscription_id"],
        type: event_source_result["type"],
      }
      data = {}
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(event_source_result)
      result = @event_sources_client.update(
        subscription_id: event_source_result["subscription_id"],
        type: event_source_result["type"],
        filter: "New filter",
        fields: "New fields"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSource)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::EventSource" do
      path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
      replacements = {
        subscription_id: event_source_result["subscription_id"],
        type: event_source_result["type"],
      }
      data = {}
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(event_source_result)
      result = @event_sources_client.update(
        subscription_id: event_source_result["subscription_id"],
        type: event_source_result["type"],
        filter: "New filter",
        fields: "New fields"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventSource)
      # expect(result.id).to eq(event_source_result["id"])
    end
  end
end
