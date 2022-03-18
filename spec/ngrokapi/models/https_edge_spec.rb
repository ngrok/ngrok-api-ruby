require 'spec_helper'

RSpec.describe NgrokAPI::Models::HTTPSEdge do
  before(:each) do
    @client = class_double("HTTPSEdgesClient")
    @https_edge = NgrokAPI::Models::HTTPSEdge.new(client: @client, result: https_edge_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::HTTPSEdge.new(client: @client, result: https_edge_result)
      expect(@https_edge == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@https_edge.to_s).to eq https_edge_result.to_s
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_hostports = 'New hostports'
      new_mutual_tls = 'New mutual_tls'
      new_tls_termination = 'New tls_termination'
      expect(@https_edge.client).to receive(:update)
      @https_edge.update(
        description: new_description,
        metadata: new_metadata,
        hostports: new_hostports,
        mutual_tls: new_mutual_tls,
        tls_termination: new_tls_termination
      )
      expect(@https_edge.description).to eq new_description
      expect(@https_edge.metadata).to eq new_metadata
      expect(@https_edge.hostports).to eq new_hostports
      expect(@https_edge.mutual_tls).to eq new_mutual_tls
      expect(@https_edge.tls_termination).to eq new_tls_termination
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@https_edge.client).to receive(:delete)
      @https_edge.delete
    end
  end
end
