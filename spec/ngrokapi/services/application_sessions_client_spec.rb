# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::ApplicationSessionsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/app/sessions/%{id}' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: application_session_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @application_sessions_client = NgrokAPI::Services::ApplicationSessionsClient.new(client: @client)
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::ApplicationSession" do
      path = '/app/sessions/%{id}'
      replacements = {
        id: application_session_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(application_session_result)
      result = @application_sessions_client.get(
        id: application_session_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::ApplicationSession)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::ApplicationSession" do
      path = '/app/sessions/%{id}'
      replacements = {
        id: application_session_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(application_session_result)
      result = @application_sessions_client.get(
        id: application_session_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::ApplicationSession)
      # expect(result.id).to eq(application_session_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/app/sessions/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @application_sessions_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/app/sessions/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @application_sessions_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/app/sessions/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @application_sessions_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(application_session_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @application_sessions_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end
end
