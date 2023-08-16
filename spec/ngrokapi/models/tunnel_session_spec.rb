# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::TunnelSession do
  before(:each) do
    @client = class_double("TunnelSessionsClient")
    @tunnel_session = NgrokAPI::Models::TunnelSession.new(client: @client, attrs: tunnel_session_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::TunnelSession.new(client: @client, attrs: tunnel_session_result)
      expect(@tunnel_session == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@tunnel_session.to_s).to eq tunnel_session_result.to_s
    end
  end
end
