# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::ServiceUser do
  before(:each) do
    @client = class_double("ServiceUsersClient")
    @service_user = NgrokAPI::Models::ServiceUser.new(client: @client, attrs: service_user_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::ServiceUser.new(client: @client, attrs: service_user_result)
      expect(@service_user == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@service_user.to_s).to eq service_user_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@service_user.client).to receive(:delete)
      @service_user.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_name = 'New name'
      new_active = 'New active'
      expect(@service_user.client).to receive(:update)
      @service_user.update(
        name: new_name,
        active: new_active
      )
      expect(@service_user.name).to eq new_name
      expect(@service_user.active).to eq new_active
    end
  end
end
