require 'spec_helper'

RSpec.describe NgrokAPI::Services::ApiKeysClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/api_keys' }
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
  let(:results) do
    {
      "keys" => [{
        "id" => "ak_1xrq8h890dWRYiRdIHeZYCdlyT7",
        "uri" => "https://api.ngrok.com/api_keys/ak_1xrq8h890dWRYiRdIHeZYCdlyT7",
        "description" => "",
        "metadata" => "",
        "created_at" => "2021-09-08T17:49:56Z",
        "token" => nil,
      }],
    }
  end
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @api_keys_client = NgrokAPI::Services::ApiKeysClient.new(client: @client)
  end

  describe "#create" do
    it "will make a POST request and return a newly created instance of NgrokAPI::Models::ApiKey" do
      merged = result
      merged['metadata'] = 'data'
      expect(@client).to receive(:post).with(path, data: { metadata: 'data' }).and_return(merged)
      result2 = @api_keys_client.create(metadata: 'data')
      expect(result2.class).to eq(NgrokAPI::Models::ApiKey)
      expect(result2.id).to eq(result["id"])
      expect(result2.metadata).to eq('data')
    end
  end

  describe "#delete" do
    it "will make a DELETE request" do
      expect(@client).to receive(:delete).with("#{path}/#{result["id"]}").and_return(nil)
      @api_keys_client.delete(id: result["id"])
    end
  end

  describe "#delete!" do
    it "will make a DELETE request" do
      expect(@client).to receive(:delete).with("#{path}/#{result["id"]}", danger: true).
        and_return(nil)
      @api_keys_client.delete!(id: result["id"])
    end

    it "will make a DELETE request and return NotFoundError if 404" do
      expect do
        expect(@client).to receive(:delete).with("#{path}/#{result["id"]}", danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result2 = @api_keys_client.delete!(id: result["id"])
        expect(result2).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a GET request and return a NgrokAPI::Models::ApiKey" do
      expect(@client).to receive(:get).with("#{path}/#{result["id"]}").and_return(result)
      result2 = @api_keys_client.get(id: result["id"])
      expect(result2.class).to eq(NgrokAPI::Models::ApiKey)
      expect(result2.id).to eq(result["id"])
    end
  end

  describe "#get!" do
    it "will make a GET request and return a NgrokAPI::Models::ApiKey" do
      expect(@client).to receive(:get).with("#{path}/#{result["id"]}", danger: true).and_return(result)
      result2 = @api_keys_client.get!(id: result["id"])
      expect(result2.class).to eq(NgrokAPI::Models::ApiKey)
      expect(result2.id).to eq(result["id"])
    end

    it "will make a GET request and return NotFoundError if 404" do
      expect do
        expect(@client).to receive(:get).with("#{path}/#{result["id"]}", danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result2 = @api_keys_client.get!(id: result["id"])
        expect(result2).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).and_return(results)
      url = "#{base_url}#{path}?before_id=#{result["id"]}&limit=1"
      result2 = @api_keys_client.list(url: url)
      expect(result2.class).to eq(NgrokAPI::Models::Listable)
      expect(result2.items.first.id).to eq(result["id"])
    end
  end

  describe "#update" do
    it "will make a PATCH request and return an updated instance of NgrokAPI::Models::ApiKey" do
      merged = result
      merged['metadata'] = 'data'
      expect(@client).to receive(:patch).
        with("#{path}/#{result["id"]}", data: { metadata: 'data' }).
        and_return(merged)
      result2 = @api_keys_client.update(id: result["id"], metadata: 'data')
      expect(result2.class).to eq(NgrokAPI::Models::ApiKey)
      expect(result2.id).to eq(result["id"])
      expect(result2.metadata).to eq('data')
    end
  end

  describe "#update!" do
    it "will make a PATCH request and return an updated instance of NgrokAPI::Models::ApiKey" do
      merged = result
      merged['metadata'] = 'data'
      expect(@client).to receive(:patch).
        with("#{path}/#{result["id"]}", danger: true, data: { metadata: 'data' }).
        and_return(merged)
      result2 = @api_keys_client.update!(id: result["id"], metadata: 'data')
      expect(result2.class).to eq(NgrokAPI::Models::ApiKey)
      expect(result2.id).to eq(result["id"])
      expect(result2.metadata).to eq('data')
    end

    it "will make a PATCH request and return NotFoundError if 404" do
      expect do
        merged = result
        merged['metadata'] = 'data'
        expect(@client).to receive(:patch).
          with("#{path}/#{result["id"]}", danger: true, data: { metadata: 'data' }).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result2 = @api_keys_client.update!(id: result["id"], metadata: 'data')
        expect(result2).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
