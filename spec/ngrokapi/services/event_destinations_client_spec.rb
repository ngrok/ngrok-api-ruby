require 'spec_helper'

RSpec.describe NgrokAPI::Services::EventDestinationsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/event_destinations' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: event_destination_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @event_destinations_client = NgrokAPI::Services::EventDestinationsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::EventDestination" do
      path = '/event_destinations'
      replacements = {
      }
      data = {}
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:format] = "New format"
      data[:target] = "New target"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(event_destination_result)
      result = @event_destinations_client.create(
        metadata: "New metadata",
        description: "New description",
        format: "New format",
        target: "New target",
        verify_with_test_event: "New verify_with_test_event"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventDestination)
      # expect(result.id).to eq(event_destination_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/event_destinations/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @event_destinations_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/event_destinations/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @event_destinations_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/event_destinations/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @event_destinations_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::EventDestination" do
      path = '/event_destinations/%{id}'
      replacements = {
        id: event_destination_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(event_destination_result)
      result = @event_destinations_client.get(
        id: event_destination_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EventDestination)
      # expect(result.id).to eq(event_destination_result["id"])
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::EventDestination" do
      path = '/event_destinations/%{id}'
      replacements = {
        id: event_destination_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(event_destination_result)
      result = @event_destinations_client.get(
        id: event_destination_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EventDestination)
      # expect(result.id).to eq(event_destination_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(event_destination_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @event_destinations_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::EventDestination" do
      path = '/event_destinations/%{id}'
      replacements = {
        id: event_destination_result["id"],
      }
      data = {}
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:format] = "New format"
      data[:target] = "New target"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(event_destination_result)
      result = @event_destinations_client.update(
        id: event_destination_result["id"],
        metadata: "New metadata",
        description: "New description",
        format: "New format",
        target: "New target",
        verify_with_test_event: "New verify_with_test_event"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventDestination)
      # expect(result.id).to eq(event_destination_result["id"])
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::EventDestination" do
      path = '/event_destinations/%{id}'
      replacements = {
        id: event_destination_result["id"],
      }
      data = {}
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:format] = "New format"
      data[:target] = "New target"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(event_destination_result)
      result = @event_destinations_client.update(
        id: event_destination_result["id"],
        metadata: "New metadata",
        description: "New description",
        format: "New format",
        target: "New target",
        verify_with_test_event: "New verify_with_test_event"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventDestination)
      # expect(result.id).to eq(event_destination_result["id"])
    end
  end
end
