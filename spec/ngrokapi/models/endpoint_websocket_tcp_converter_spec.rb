require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointWebsocketTCPConverter do
  before(:each) do
    @client = class_double("EndpointWebsocketTCPConvertersClient")
    @endpoint_websocket_tcp_converter = NgrokAPI::Models::EndpointWebsocketTCPConverter.new(client: @client, result: endpoint_websocket_tcp_converter_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointWebsocketTCPConverter.new(client: @client, result: endpoint_websocket_tcp_converter_result)
      expect(@endpoint_websocket_tcp_converter == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_websocket_tcp_converter.to_s).to eq endpoint_websocket_tcp_converter_result.to_s
    end
  end
end
