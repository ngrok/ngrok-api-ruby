require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventStream do
  before(:each) do
    @client = class_double("EventStreamsClient")
    @event_stream = NgrokAPI::Models::EventStream.new(client: @client, result: event_stream_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventStream.new(client: @client, result: event_stream_result)
      expect(@event_stream == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_stream.to_s).to eq event_stream_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@event_stream.client).to receive(:delete)
      @event_stream.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_metadata = 'New metadata'
      new_description = 'New description'
      new_fields = 'New fields'
      new_destination_ids = 'New destination_ids'
      new_sampling_rate = 'New sampling_rate'
      expect(@event_stream.client).to receive(:update)
      @event_stream.update(
        metadata: new_metadata,
        description: new_description,
        fields: new_fields,
        destination_ids: new_destination_ids,
        sampling_rate: new_sampling_rate
      )
      expect(@event_stream.metadata).to eq new_metadata
      expect(@event_stream.description).to eq new_description
      expect(@event_stream.fields).to eq new_fields
      expect(@event_stream.destination_ids).to eq new_destination_ids
      expect(@event_stream.sampling_rate).to eq new_sampling_rate
    end
  end
end
