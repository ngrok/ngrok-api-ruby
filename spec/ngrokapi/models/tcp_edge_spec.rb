# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::TCPEdge do
  before(:each) do
    @client = class_double("TCPEdgesClient")
    @tcp_edge = NgrokAPI::Models::TCPEdge.new(client: @client, attrs: tcp_edge_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::TCPEdge.new(client: @client, attrs: tcp_edge_result)
      expect(@tcp_edge == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@tcp_edge.to_s).to eq tcp_edge_result.to_s
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_hostports = 'New hostports'
      new_backend = 'New backend'
      new_ip_restriction = 'New ip_restriction'
      expect(@tcp_edge.client).to receive(:update)
      @tcp_edge.update(
        description: new_description,
        metadata: new_metadata,
        hostports: new_hostports,
        backend: new_backend,
        ip_restriction: new_ip_restriction
      )
      expect(@tcp_edge.description).to eq new_description
      expect(@tcp_edge.metadata).to eq new_metadata
      expect(@tcp_edge.hostports).to eq new_hostports
      expect(@tcp_edge.backend).to eq new_backend
      expect(@tcp_edge.ip_restriction).to eq new_ip_restriction
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@tcp_edge.client).to receive(:delete)
      @tcp_edge.delete
    end
  end
end
