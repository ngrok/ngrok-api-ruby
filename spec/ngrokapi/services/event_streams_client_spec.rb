require 'spec_helper'

RSpec.describe NgrokAPI::Services::EventStreamsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/event_streams' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: event_stream_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @event_streams_client = NgrokAPI::Services::EventStreamsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::EventStream" do
      path = '/event_streams'
      replacements = {
      }
      data = {}
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:fields] = "New fields"
      data[:event_type] = "New event_type"
      data[:destination_ids] = "New destination_ids"
      data[:sampling_rate] = "New sampling_rate"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(event_stream_result)
      result = @event_streams_client.create(
        metadata: "New metadata",
        description: "New description",
        fields: "New fields",
        event_type: "New event_type",
        destination_ids: "New destination_ids",
        sampling_rate: "New sampling_rate"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventStream)
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/event_streams/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @event_streams_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/event_streams/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @event_streams_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/event_streams/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @event_streams_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::EventStream" do
      path = '/event_streams/%{id}'
      replacements = {
        id: event_stream_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(event_stream_result)
      result = @event_streams_client.get(
        id: event_stream_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EventStream)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::EventStream" do
      path = '/event_streams/%{id}'
      replacements = {
        id: event_stream_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(event_stream_result)
      result = @event_streams_client.get(
        id: event_stream_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EventStream)
      # expect(result.id).to eq(event_stream_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(event_stream_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @event_streams_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::EventStream" do
      path = '/event_streams/%{id}'
      replacements = {
        id: event_stream_result["id"],
      }
      data = {}
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:fields] = "New fields"
      data[:destination_ids] = "New destination_ids"
      data[:sampling_rate] = "New sampling_rate"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(event_stream_result)
      result = @event_streams_client.update(
        id: event_stream_result["id"],
        metadata: "New metadata",
        description: "New description",
        fields: "New fields",
        destination_ids: "New destination_ids",
        sampling_rate: "New sampling_rate"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventStream)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::EventStream" do
      path = '/event_streams/%{id}'
      replacements = {
        id: event_stream_result["id"],
      }
      data = {}
      data[:metadata] = "New metadata"
      data[:description] = "New description"
      data[:fields] = "New fields"
      data[:destination_ids] = "New destination_ids"
      data[:sampling_rate] = "New sampling_rate"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(event_stream_result)
      result = @event_streams_client.update(
        id: event_stream_result["id"],
        metadata: "New metadata",
        description: "New description",
        fields: "New fields",
        destination_ids: "New destination_ids",
        sampling_rate: "New sampling_rate"
      )
      expect(result.class).to eq(NgrokAPI::Models::EventStream)
      # expect(result.id).to eq(event_stream_result["id"])
    end
  end
end
