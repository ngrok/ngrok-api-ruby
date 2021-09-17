require 'spec_helper'

RSpec.describe NgrokAPI::HttpClient do
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

  before(:each) do
    api_key = 'abc'
    @client = NgrokAPI::HttpClient.new(api_key: api_key)
  end

  describe "#delete" do
    it "will delete and return an empty body" do
      url = "#{base_url}#{path}/#{result["id"]}"
      stub_request(:delete, url).to_return(body: nil)
      expect(@client.delete(url)).to eq(nil)
    end
  end

  describe "#get" do
    it "will get the returned resource json" do
      url = "#{base_url}#{path}/#{result["id"]}"
      stub_request(:get, url).to_return(body: result.to_json)
      expect(@client.get(url)).to eq(result)
    end

    it "will raise a NotFoundError if 404" do
      url = "#{base_url}#{path}/#{result["id"]}"
      stub_request(:get, url).to_return(body: nil, status: 404)
      expect do
        @client.get(url, danger: true)
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#list" do
    it "with a url will return based on the absolute URL" do
      url = "#{base_url}#{path}?before_id=#{result["id"]}&limit=1"
      stub_request(:get, url).to_return(body: results.to_json)
      expect(@client.list(url: url)).to eq(results)
    end

    it "without a url will return based on the path, before_id, and limit" do
      url = "#{base_url}#{path}?before_id=#{result["id"]}&limit=1"
      stub_request(:get, url).to_return(body: results.to_json)
      expect(@client.list(before_id: result["id"], limit: 1, path: path)).to eq(results)
    end
  end

  describe "#patch" do
    it "updates an existing resource" do
      merged = result
      merged['metadata'] = 'updated'
      url = "#{base_url}#{path}/#{result["id"]}"
      stub_request(:patch, url).to_return(body: merged.to_json)
      expect(@client.patch(url)).to eq(merged)
    end
  end

  describe "#post" do
    it "creates a new resource" do
      url = "#{base_url}#{path}/#{result["id"]}"
      stub_request(:post, url).to_return(body: result.to_json)
      expect(@client.post(url)).to eq(result)
    end
  end
end
