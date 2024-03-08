# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::TLSEdge do
  before(:each) do
    @client = class_double("TLSEdgesClient")
    @tls_edge = NgrokAPI::Models::TLSEdge.new(client: @client, attrs: tls_edge_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::TLSEdge.new(client: @client, attrs: tls_edge_result)
      expect(@tls_edge == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@tls_edge.to_s).to eq tls_edge_result.to_s
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_hostports = 'New hostports'
      new_backend = 'New backend'
      new_ip_restriction = 'New ip_restriction'
      new_mutual_tls = 'New mutual_tls'
      new_tls_termination = 'New tls_termination'
      new_policy = 'New policy'
      expect(@tls_edge.client).to receive(:update)
      @tls_edge.update(
        description: new_description,
        metadata: new_metadata,
        hostports: new_hostports,
        backend: new_backend,
        ip_restriction: new_ip_restriction,
        mutual_tls: new_mutual_tls,
        tls_termination: new_tls_termination,
        policy: new_policy
      )
      expect(@tls_edge.description).to eq new_description
      expect(@tls_edge.metadata).to eq new_metadata
      expect(@tls_edge.hostports).to eq new_hostports
      expect(@tls_edge.backend).to eq new_backend
      expect(@tls_edge.ip_restriction).to eq new_ip_restriction
      expect(@tls_edge.mutual_tls).to eq new_mutual_tls
      expect(@tls_edge.tls_termination).to eq new_tls_termination
      expect(@tls_edge.policy).to eq new_policy
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@tls_edge.client).to receive(:delete)
      @tls_edge.delete
    end
  end
end
