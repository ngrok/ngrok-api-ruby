require 'spec_helper'

RSpec.describe NgrokAPI::Models::WeightedBackend do
  before(:each) do
    @client = class_double("WeightedBackendsClient")
    @weighted_backend = NgrokAPI::Models::WeightedBackend.new(client: @client, result: weighted_backend_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::WeightedBackend.new(client: @client, result: weighted_backend_result)
      expect(@weighted_backend == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@weighted_backend.to_s).to eq weighted_backend_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@weighted_backend.client).to receive(:delete)
      @weighted_backend.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_backends = 'New backends'
      expect(@weighted_backend.client).to receive(:update)
      @weighted_backend.update(
        description: new_description,
        metadata: new_metadata,
        backends: new_backends
      )
      expect(@weighted_backend.description).to eq new_description
      expect(@weighted_backend.metadata).to eq new_metadata
      expect(@weighted_backend.backends).to eq new_backends
    end
  end
end
