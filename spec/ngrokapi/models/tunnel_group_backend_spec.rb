require 'spec_helper'

RSpec.describe NgrokAPI::Models::TunnelGroupBackend do
  before(:each) do
    @client = class_double("TunnelGroupBackendsClient")
    @tunnel_group_backend = NgrokAPI::Models::TunnelGroupBackend.new(client: @client, attrs: tunnel_group_backend_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::TunnelGroupBackend.new(client: @client, attrs: tunnel_group_backend_result)
      expect(@tunnel_group_backend == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@tunnel_group_backend.to_s).to eq tunnel_group_backend_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@tunnel_group_backend.client).to receive(:delete)
      @tunnel_group_backend.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_labels = 'New labels'
      expect(@tunnel_group_backend.client).to receive(:update)
      @tunnel_group_backend.update(
        description: new_description,
        metadata: new_metadata,
        labels: new_labels
      )
      expect(@tunnel_group_backend.description).to eq new_description
      expect(@tunnel_group_backend.metadata).to eq new_metadata
      expect(@tunnel_group_backend.labels).to eq new_labels
    end
  end
end
