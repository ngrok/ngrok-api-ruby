require 'spec_helper'

RSpec.describe NgrokAPI::Services::TunnelSessionsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/tunnel_sessions' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: tunnel_session_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @tunnel_sessions_client = NgrokAPI::Services::TunnelSessionsClient.new(client: @client)
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(tunnel_session_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @tunnel_sessions_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::TunnelSession" do
      path = '/tunnel_sessions/%{id}'
      replacements = {
        id: tunnel_session_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(tunnel_session_result)
      result = @tunnel_sessions_client.get(
        id: tunnel_session_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::TunnelSession)
      # expect(result.id).to eq(tunnel_session_result["id"])
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::TunnelSession" do
      path = '/tunnel_sessions/%{id}'
      replacements = {
        id: tunnel_session_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(tunnel_session_result)
      result = @tunnel_sessions_client.get(
        id: tunnel_session_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::TunnelSession)
      # expect(result.id).to eq(tunnel_session_result["id"])
    end
  end

  describe "#restart" do
    it "will make a post request" do
      path = '/tunnel_sessions/%{id}/restart'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:post).with(path % replacements).and_return(nil)
      @tunnel_sessions_client.restart(
        id: api_key_result["id"]
      )
    end
  end

  describe "#restart!" do
    it "will make a post request" do
      path = '/tunnel_sessions/%{id}/restart'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:post).with(path % replacements, danger: true).and_return(nil)
      @tunnel_sessions_client.restart!(
        id: api_key_result["id"]
      )
    end

    it "will make a post request and return NotFoundError if 404" do
      path = '/tunnel_sessions/%{id}/restart'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:post).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @tunnel_sessions_client.restart!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#stop" do
    it "will make a post request" do
      path = '/tunnel_sessions/%{id}/stop'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:post).with(path % replacements).and_return(nil)
      @tunnel_sessions_client.stop(
        id: api_key_result["id"]
      )
    end
  end

  describe "#stop!" do
    it "will make a post request" do
      path = '/tunnel_sessions/%{id}/stop'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:post).with(path % replacements, danger: true).and_return(nil)
      @tunnel_sessions_client.stop!(
        id: api_key_result["id"]
      )
    end

    it "will make a post request and return NotFoundError if 404" do
      path = '/tunnel_sessions/%{id}/stop'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:post).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @tunnel_sessions_client.stop!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#update" do
    it "will make a post request" do
      path = '/tunnel_sessions/%{id}/update'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:post).with(path % replacements).and_return(nil)
      @tunnel_sessions_client.update(
        id: api_key_result["id"],
        version: api_key_result["version"]
      )
    end
  end

  describe "#update!" do
    it "will make a post request" do
      path = '/tunnel_sessions/%{id}/update'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:post).with(path % replacements, danger: true).and_return(nil)
      @tunnel_sessions_client.update!(
        id: api_key_result["id"],
        version: api_key_result["version"]
      )
    end

    it "will make a post request and return NotFoundError if 404" do
      path = '/tunnel_sessions/%{id}/update'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:post).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @tunnel_sessions_client.update!(
          id: api_key_result["id"],
          version: api_key_result["version"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
