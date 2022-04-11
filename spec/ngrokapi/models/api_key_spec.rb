require 'spec_helper'

RSpec.describe NgrokAPI::Models::APIKey do
  before(:each) do
    @client = class_double("APIKeysClient")
    @api_key = NgrokAPI::Models::APIKey.new(client: @client, attrs: api_key_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::APIKey.new(client: @client, attrs: api_key_result)
      expect(@api_key == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@api_key.to_s).to eq api_key_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@api_key.client).to receive(:delete)
      @api_key.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      expect(@api_key.client).to receive(:update)
      @api_key.update(
        description: new_description,
        metadata: new_metadata
      )
      expect(@api_key.description).to eq new_description
      expect(@api_key.metadata).to eq new_metadata
    end
  end
end
