require 'spec_helper'

RSpec.describe NgrokAPI::Services::TunnelsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/tunnels' }

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
end
