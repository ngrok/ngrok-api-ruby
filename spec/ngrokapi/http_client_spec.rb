require 'spec_helper'

RSpec.describe NgrokAPI::HttpClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/api_keys' }

  before(:each) do
    api_key = 'abc'
    @client = NgrokAPI::HttpClient.new(api_key: api_key)
  end

  describe "#delete" do
    it "will delete and return an empty body" do
      url = "#{base_url}#{path}/#{api_key_result["id"]}"
      stub_request(:delete, url).to_return(body: nil)
      expect(@client.delete(url)).to eq(nil)
    end
  end

  describe "#get" do
    it "will get the returned resource json" do
      url = "#{base_url}#{path}/#{api_key_result["id"]}"
      stub_request(:get, url).to_return(body: api_key_result.to_json)
      expect(@client.get(url)).to eq(api_key_result)
    end

    it "will raise a NotFoundError if 404" do
      url = "#{base_url}#{path}/#{api_key_result["id"]}"
      stub_request(:get, url).to_return(body: nil, status: 404)
      expect do
        @client.get(url, danger: true)
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end

    it "will raise a NgrokAPI::Error if >= 400" do
      url = "#{base_url}#{path}/#{api_key_result["id"]}"
      stub_request(:get, url).to_return(body: nil, status: 400)
      expect do
        @client.get(url, danger: true)
      end.to raise_error(NgrokAPI::Error)
    end
  end

  describe "#list" do
    it "with a url will return based on the absolute URL" do
      url = "#{base_url}#{path}?before_id=#{api_key_result["id"]}&limit=1"
      stub_request(:get, url).to_return(body: api_key_results.to_json)
      expect(@client.list(url: url)).to eq(api_key_results)
    end

    it "without a url will return based on the path, before_id, and limit" do
      url = "#{base_url}#{path}?before_id=#{api_key_result["id"]}&limit=1"
      stub_request(:get, url).to_return(body: api_key_results.to_json)
      expect(@client.list(before_id: api_key_result["id"], limit: 1, path: path)).to eq(api_key_results)
    end
  end

  describe "#patch" do
    it "updates an existing resource" do
      merged = api_key_result
      merged['metadata'] = 'updated'
      url = "#{base_url}#{path}/#{api_key_result["id"]}"
      stub_request(:patch, url).to_return(body: merged.to_json)
      expect(@client.patch(url)).to eq(merged)
    end
  end

  describe "#post" do
    it "creates a new resource" do
      url = "#{base_url}#{path}/#{api_key_result["id"]}"
      stub_request(:post, url).to_return(body: api_key_result.to_json)
      expect(@client.post(url)).to eq(api_key_result)
    end
  end
end
