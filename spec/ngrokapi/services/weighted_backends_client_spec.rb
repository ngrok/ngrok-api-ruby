require 'spec_helper'

RSpec.describe NgrokAPI::Services::WeightedBackendsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/backends/weighted' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: weighted_backend_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @weighted_backends_client = NgrokAPI::Services::WeightedBackendsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::WeightedBackend" do
      path = '/backends/weighted'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:backends] = "New backends"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(weighted_backend_result)
      result = @weighted_backends_client.create(
        description: "New description",
        metadata: "New metadata",
        backends: "New backends"
      )
      expect(result.class).to eq(NgrokAPI::Models::WeightedBackend)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::WeightedBackend" do
      path = '/backends/weighted'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:backends] = "New backends"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(weighted_backend_result)
      result = @weighted_backends_client.create(
        description: "New description",
        metadata: "New metadata",
        backends: "New backends"
      )
      expect(result.class).to eq(NgrokAPI::Models::WeightedBackend)
      # expect(result.id).to eq(weighted_backend_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/backends/weighted/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @weighted_backends_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/backends/weighted/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @weighted_backends_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/backends/weighted/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @weighted_backends_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::WeightedBackend" do
      path = '/backends/weighted/%{id}'
      replacements = {
        id: weighted_backend_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(weighted_backend_result)
      result = @weighted_backends_client.get(
        id: weighted_backend_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::WeightedBackend)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::WeightedBackend" do
      path = '/backends/weighted/%{id}'
      replacements = {
        id: weighted_backend_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(weighted_backend_result)
      result = @weighted_backends_client.get(
        id: weighted_backend_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::WeightedBackend)
      # expect(result.id).to eq(weighted_backend_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(weighted_backend_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @weighted_backends_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::WeightedBackend" do
      path = '/backends/weighted/%{id}'
      replacements = {
        id: weighted_backend_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:backends] = "New backends"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(weighted_backend_result)
      result = @weighted_backends_client.update(
        id: weighted_backend_result["id"],
        description: "New description",
        metadata: "New metadata",
        backends: "New backends"
      )
      expect(result.class).to eq(NgrokAPI::Models::WeightedBackend)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::WeightedBackend" do
      path = '/backends/weighted/%{id}'
      replacements = {
        id: weighted_backend_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:backends] = "New backends"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(weighted_backend_result)
      result = @weighted_backends_client.update(
        id: weighted_backend_result["id"],
        description: "New description",
        metadata: "New metadata",
        backends: "New backends"
      )
      expect(result.class).to eq(NgrokAPI::Models::WeightedBackend)
      # expect(result.id).to eq(weighted_backend_result["id"])
    end
  end
end
