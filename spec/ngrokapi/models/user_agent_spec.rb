require 'spec_helper'

RSpec.describe NgrokAPI::Models::UserAgent do
  before(:each) do
    @client = class_double("UserAgentsClient")
    @user_agent = NgrokAPI::Models::UserAgent.new(client: @client, attrs: user_agent_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::UserAgent.new(client: @client, attrs: user_agent_result)
      expect(@user_agent == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@user_agent.to_s).to eq user_agent_result.to_s
    end
  end
end
