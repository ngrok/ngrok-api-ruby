require 'spec_helper'

RSpec.describe NgrokAPI::Services::HTTPResponseBackendsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/backends/http_response' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: http_response_backend_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @http_response_backends_client = NgrokAPI::Services::HTTPResponseBackendsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::HTTPResponseBackend" do
      path = '/backends/http_response'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:body] = "New body"
      data[:headers] = "New headers"
      data[:status_code] = "New status_code"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(http_response_backend_result)
      result = @http_response_backends_client.create(
        description: "New description",
        metadata: "New metadata",
        body: "New body",
        headers: "New headers",
        status_code: "New status_code"
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPResponseBackend)
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/backends/http_response/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @http_response_backends_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/backends/http_response/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @http_response_backends_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/backends/http_response/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @http_response_backends_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::HTTPResponseBackend" do
      path = '/backends/http_response/%{id}'
      replacements = {
        id: http_response_backend_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(http_response_backend_result)
      result = @http_response_backends_client.get(
        id: http_response_backend_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPResponseBackend)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::HTTPResponseBackend" do
      path = '/backends/http_response/%{id}'
      replacements = {
        id: http_response_backend_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(http_response_backend_result)
      result = @http_response_backends_client.get(
        id: http_response_backend_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPResponseBackend)
      # expect(result.id).to eq(http_response_backend_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(http_response_backend_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @http_response_backends_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::HTTPResponseBackend" do
      path = '/backends/http_response/%{id}'
      replacements = {
        id: http_response_backend_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:body] = "New body"
      data[:headers] = "New headers"
      data[:status_code] = "New status_code"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(http_response_backend_result)
      result = @http_response_backends_client.update(
        id: http_response_backend_result["id"],
        description: "New description",
        metadata: "New metadata",
        body: "New body",
        headers: "New headers",
        status_code: "New status_code"
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPResponseBackend)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::HTTPResponseBackend" do
      path = '/backends/http_response/%{id}'
      replacements = {
        id: http_response_backend_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:body] = "New body"
      data[:headers] = "New headers"
      data[:status_code] = "New status_code"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(http_response_backend_result)
      result = @http_response_backends_client.update(
        id: http_response_backend_result["id"],
        description: "New description",
        metadata: "New metadata",
        body: "New body",
        headers: "New headers",
        status_code: "New status_code"
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPResponseBackend)
      # expect(result.id).to eq(http_response_backend_result["id"])
    end
  end
end
