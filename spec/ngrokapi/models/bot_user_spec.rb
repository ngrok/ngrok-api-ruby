# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::BotUser do
  before(:each) do
    @client = class_double("BotUsersClient")
    @bot_user = NgrokAPI::Models::BotUser.new(client: @client, attrs: bot_user_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::BotUser.new(client: @client, attrs: bot_user_result)
      expect(@bot_user == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@bot_user.to_s).to eq bot_user_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@bot_user.client).to receive(:delete)
      @bot_user.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_name = 'New name'
      new_active = 'New active'
      expect(@bot_user.client).to receive(:update)
      @bot_user.update(
        name: new_name,
        active: new_active
      )
      expect(@bot_user.name).to eq new_name
      expect(@bot_user.active).to eq new_active
    end
  end
end
