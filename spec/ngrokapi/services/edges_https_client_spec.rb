require 'spec_helper'

RSpec.describe NgrokAPI::Services::EdgesHTTPSClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/edges/https' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: https_edge_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @edges_https_client = NgrokAPI::Services::EdgesHTTPSClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::HTTPSEdge" do
      path = '/edges/https'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:hostports] = "New hostports"
      data[:mutual_tls] = "New mutual_tls"
      data[:tls_termination] = "New tls_termination"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(https_edge_result)
      result = @edges_https_client.create(
        description: "New description",
        metadata: "New metadata",
        hostports: "New hostports",
        mutual_tls: "New mutual_tls",
        tls_termination: "New tls_termination"
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdge)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::HTTPSEdge" do
      path = '/edges/https'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:hostports] = "New hostports"
      data[:mutual_tls] = "New mutual_tls"
      data[:tls_termination] = "New tls_termination"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(https_edge_result)
      result = @edges_https_client.create(
        description: "New description",
        metadata: "New metadata",
        hostports: "New hostports",
        mutual_tls: "New mutual_tls",
        tls_termination: "New tls_termination"
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdge)
      # expect(result.id).to eq(https_edge_result["id"])
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::HTTPSEdge" do
      path = '/edges/https/%{id}'
      replacements = {
        id: https_edge_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(https_edge_result)
      result = @edges_https_client.get(
        id: https_edge_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdge)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::HTTPSEdge" do
      path = '/edges/https/%{id}'
      replacements = {
        id: https_edge_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(https_edge_result)
      result = @edges_https_client.get(
        id: https_edge_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdge)
      # expect(result.id).to eq(https_edge_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(https_edge_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @edges_https_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::HTTPSEdge" do
      path = '/edges/https/%{id}'
      replacements = {
        id: https_edge_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:hostports] = "New hostports"
      data[:mutual_tls] = "New mutual_tls"
      data[:tls_termination] = "New tls_termination"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(https_edge_result)
      result = @edges_https_client.update(
        id: https_edge_result["id"],
        description: "New description",
        metadata: "New metadata",
        hostports: "New hostports",
        mutual_tls: "New mutual_tls",
        tls_termination: "New tls_termination"
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdge)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::HTTPSEdge" do
      path = '/edges/https/%{id}'
      replacements = {
        id: https_edge_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:hostports] = "New hostports"
      data[:mutual_tls] = "New mutual_tls"
      data[:tls_termination] = "New tls_termination"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(https_edge_result)
      result = @edges_https_client.update(
        id: https_edge_result["id"],
        description: "New description",
        metadata: "New metadata",
        hostports: "New hostports",
        mutual_tls: "New mutual_tls",
        tls_termination: "New tls_termination"
      )
      expect(result.class).to eq(NgrokAPI::Models::HTTPSEdge)
      # expect(result.id).to eq(https_edge_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/edges/https/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @edges_https_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/edges/https/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @edges_https_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/edges/https/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @edges_https_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
