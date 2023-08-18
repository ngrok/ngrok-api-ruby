# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::ApplicationUser do
  before(:each) do
    @client = class_double("ApplicationUsersClient")
    @application_user = NgrokAPI::Models::ApplicationUser.new(client: @client, attrs: application_user_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::ApplicationUser.new(client: @client, attrs: application_user_result)
      expect(@application_user == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@application_user.to_s).to eq application_user_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@application_user.client).to receive(:delete)
      @application_user.delete
    end
  end
end
