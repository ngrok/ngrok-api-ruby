require 'spec_helper'

RSpec.describe NgrokAPI::Models::ApiKey do
  let(:result) do
    {
      "id" => "ak_1xrq8h890dWRYiRdIHeZYCdlyT7",
      "uri" => "https://api.ngrok.com/api_keys/ak_1xrq8h890dWRYiRdIHeZYCdlyT7",
      "description" => "",
      "metadata" => "",
      "created_at" => "2021-09-08T17:49:56Z",
      "token" => nil,
    }
  end

  before(:each) do
    @client = class_double("ApiKeysClient")
    @api_key = NgrokAPI::Models::ApiKey.new(client: @client, result: result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      key2 = NgrokAPI::Models::ApiKey.new(client: @client, result: result)
      expect(@api_key == key2).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@api_key.to_s).to eq result.to_s
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
