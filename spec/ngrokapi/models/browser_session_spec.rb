require 'spec_helper'

RSpec.describe NgrokAPI::Models::BrowserSession do
  before(:each) do
    @client = class_double("BrowserSessionsClient")
    @browser_session = NgrokAPI::Models::BrowserSession.new(client: @client, attrs: browser_session_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::BrowserSession.new(client: @client, attrs: browser_session_result)
      expect(@browser_session == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@browser_session.to_s).to eq browser_session_result.to_s
    end
  end
end
