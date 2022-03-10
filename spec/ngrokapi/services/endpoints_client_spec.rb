require 'spec_helper'

RSpec.describe NgrokAPI::Services::EndpointsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/endpoints' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: endpoint_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @endpoints_client = NgrokAPI::Services::EndpointsClient.new(client: @client)
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(endpoint_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @endpoints_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::Endpoint" do
      path = '/endpoints/%{id}'
      replacements = {
        id: endpoint_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_result)
      result = @endpoints_client.get(
        id: endpoint_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::Endpoint)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::Endpoint" do
      path = '/endpoints/%{id}'
      replacements = {
        id: endpoint_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_result)
      result = @endpoints_client.get(
        id: endpoint_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::Endpoint)
      # expect(result.id).to eq(endpoint_result["id"])
    end
  end
end
