require 'spec_helper'

RSpec.describe NgrokAPI::Models::ApplicationSession do
  before(:each) do
    @client = class_double("ApplicationSessionsClient")
    @application_session = NgrokAPI::Models::ApplicationSession.new(client: @client, attrs: application_session_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::ApplicationSession.new(client: @client, attrs: application_session_result)
      expect(@application_session == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@application_session.to_s).to eq application_session_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@application_session.client).to receive(:delete)
      @application_session.delete
    end
  end
end
