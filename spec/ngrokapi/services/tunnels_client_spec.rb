# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::TunnelsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/tunnels' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: tunnel_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @tunnels_client = NgrokAPI::Services::TunnelsClient.new(client: @client)
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(tunnel_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @tunnels_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::Tunnel" do
      path = '/tunnels/%{id}'
      replacements = {
        id: tunnel_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(tunnel_result)
      result = @tunnels_client.get(
        id: tunnel_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::Tunnel)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::Tunnel" do
      path = '/tunnels/%{id}'
      replacements = {
        id: tunnel_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(tunnel_result)
      result = @tunnels_client.get(
        id: tunnel_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::Tunnel)
      # expect(result.id).to eq(tunnel_result["id"])
    end
  end
end
