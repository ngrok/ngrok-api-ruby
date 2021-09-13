require 'spec_helper'

RSpec.describe NgrokAPI::Models::ApiKey do
  before(:each) do
    client = class_double("ApiKeysClient")
    result = {
      "id" => "ak_1xrq8h890dWRYiRdIHeZYCdlyT7",
      "uri" => "https://api.ngrok.com/api_keys/ak_1xrq8h890dWRYiRdIHeZYCdlyT7",
      "description" => "",
      "metadata" => "",
      "created_at" => "2021-09-08T17:49:56Z",
      "token" => nil,
    }
    @api_key = NgrokAPI::Models::ApiKey.new(client: client, result: result)
  end

  describe "#==" do
    pending "should be equal if X" do
      expect(1).to eq 2
    end
  end

  describe "#to_s" do
    pending "should stringify with X" do
      expect(1).to eq 2
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@api_key.client).to receive(:delete)
      @api_key.delete
    end
  end

  describe "#update" do
    it "updates instance's description and metadata and call update on the client" do
      new_description = 'new description'
      new_metadata = 'new metadata'
      expect(@api_key.client).to receive(:update)

      @api_key.update(
        description: new_description,
        metadata: new_metadata,
      )
      expect(@api_key.description).to eq new_description
      expect(@api_key.metadata).to eq new_metadata
    end
  end
end
