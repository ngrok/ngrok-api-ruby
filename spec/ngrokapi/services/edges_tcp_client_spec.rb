# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::EdgesTCPClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/edges/tcp' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: tcp_edge_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @edges_tcp_client = NgrokAPI::Services::EdgesTCPClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::TCPEdge" do
      path = '/edges/tcp'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:hostports] = "New hostports"
      data[:backend] = "New backend"
      data[:ip_restriction] = "New ip_restriction"
      data[:traffic_policy] = "New traffic_policy"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(tcp_edge_result)
      result = @edges_tcp_client.create(
        description: "New description",
        metadata: "New metadata",
        hostports: "New hostports",
        backend: "New backend",
        ip_restriction: "New ip_restriction",
        policy: "New policy",
        traffic_policy: "New traffic_policy"
      )
      expect(result.class).to eq(NgrokAPI::Models::TCPEdge)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::TCPEdge" do
      path = '/edges/tcp'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:hostports] = "New hostports"
      data[:backend] = "New backend"
      data[:ip_restriction] = "New ip_restriction"
      data[:traffic_policy] = "New traffic_policy"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(tcp_edge_result)
      result = @edges_tcp_client.create(
        description: "New description",
        metadata: "New metadata",
        hostports: "New hostports",
        backend: "New backend",
        ip_restriction: "New ip_restriction",
        policy: "New policy",
        traffic_policy: "New traffic_policy"
      )
      expect(result.class).to eq(NgrokAPI::Models::TCPEdge)
      # expect(result.id).to eq(tcp_edge_result["id"])
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::TCPEdge" do
      path = '/edges/tcp/%{id}'
      replacements = {
        id: tcp_edge_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(tcp_edge_result)
      result = @edges_tcp_client.get(
        id: tcp_edge_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::TCPEdge)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::TCPEdge" do
      path = '/edges/tcp/%{id}'
      replacements = {
        id: tcp_edge_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(tcp_edge_result)
      result = @edges_tcp_client.get(
        id: tcp_edge_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::TCPEdge)
      # expect(result.id).to eq(tcp_edge_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(tcp_edge_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @edges_tcp_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::TCPEdge" do
      path = '/edges/tcp/%{id}'
      replacements = {
        id: tcp_edge_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:hostports] = "New hostports"
      data[:backend] = "New backend"
      data[:ip_restriction] = "New ip_restriction"
      data[:traffic_policy] = "New traffic_policy"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(tcp_edge_result)
      result = @edges_tcp_client.update(
        id: tcp_edge_result["id"],
        description: "New description",
        metadata: "New metadata",
        hostports: "New hostports",
        backend: "New backend",
        ip_restriction: "New ip_restriction",
        policy: "New policy",
        traffic_policy: "New traffic_policy"
      )
      expect(result.class).to eq(NgrokAPI::Models::TCPEdge)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::TCPEdge" do
      path = '/edges/tcp/%{id}'
      replacements = {
        id: tcp_edge_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:hostports] = "New hostports"
      data[:backend] = "New backend"
      data[:ip_restriction] = "New ip_restriction"
      data[:traffic_policy] = "New traffic_policy"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(tcp_edge_result)
      result = @edges_tcp_client.update(
        id: tcp_edge_result["id"],
        description: "New description",
        metadata: "New metadata",
        hostports: "New hostports",
        backend: "New backend",
        ip_restriction: "New ip_restriction",
        policy: "New policy",
        traffic_policy: "New traffic_policy"
      )
      expect(result.class).to eq(NgrokAPI::Models::TCPEdge)
      # expect(result.id).to eq(tcp_edge_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/edges/tcp/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @edges_tcp_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/edges/tcp/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @edges_tcp_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/edges/tcp/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @edges_tcp_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
