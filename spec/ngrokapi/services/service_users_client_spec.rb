# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::ServiceUsersClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/service_users' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: service_user_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @service_users_client = NgrokAPI::Services::ServiceUsersClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::ServiceUser" do
      path = '/service_users'
      replacements = {
      }
      data = {}
      data[:name] = "New name"
      data[:active] = "New active"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(service_user_result)
      result = @service_users_client.create(
        name: "New name",
        active: "New active"
      )
      expect(result.class).to eq(NgrokAPI::Models::ServiceUser)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::ServiceUser" do
      path = '/service_users'
      replacements = {
      }
      data = {}
      data[:name] = "New name"
      data[:active] = "New active"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(service_user_result)
      result = @service_users_client.create(
        name: "New name",
        active: "New active"
      )
      expect(result.class).to eq(NgrokAPI::Models::ServiceUser)
      # expect(result.id).to eq(service_user_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/service_users/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @service_users_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/service_users/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @service_users_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/service_users/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @service_users_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::ServiceUser" do
      path = '/service_users/%{id}'
      replacements = {
        id: service_user_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(service_user_result)
      result = @service_users_client.get(
        id: service_user_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::ServiceUser)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::ServiceUser" do
      path = '/service_users/%{id}'
      replacements = {
        id: service_user_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(service_user_result)
      result = @service_users_client.get(
        id: service_user_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::ServiceUser)
      # expect(result.id).to eq(service_user_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(service_user_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @service_users_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::ServiceUser" do
      path = '/service_users/%{id}'
      replacements = {
        id: service_user_result["id"],
      }
      data = {}
      data[:name] = "New name"
      data[:active] = "New active"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(service_user_result)
      result = @service_users_client.update(
        id: service_user_result["id"],
        name: "New name",
        active: "New active"
      )
      expect(result.class).to eq(NgrokAPI::Models::ServiceUser)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::ServiceUser" do
      path = '/service_users/%{id}'
      replacements = {
        id: service_user_result["id"],
      }
      data = {}
      data[:name] = "New name"
      data[:active] = "New active"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(service_user_result)
      result = @service_users_client.update(
        id: service_user_result["id"],
        name: "New name",
        active: "New active"
      )
      expect(result.class).to eq(NgrokAPI::Models::ServiceUser)
      # expect(result.id).to eq(service_user_result["id"])
    end
  end
end
