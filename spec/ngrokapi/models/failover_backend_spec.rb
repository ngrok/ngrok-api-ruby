# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::FailoverBackend do
  before(:each) do
    @client = class_double("FailoverBackendsClient")
    @failover_backend = NgrokAPI::Models::FailoverBackend.new(client: @client, attrs: failover_backend_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::FailoverBackend.new(client: @client, attrs: failover_backend_result)
      expect(@failover_backend == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@failover_backend.to_s).to eq failover_backend_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@failover_backend.client).to receive(:delete)
      @failover_backend.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_backends = 'New backends'
      expect(@failover_backend.client).to receive(:update)
      @failover_backend.update(
        description: new_description,
        metadata: new_metadata,
        backends: new_backends
      )
      expect(@failover_backend.description).to eq new_description
      expect(@failover_backend.metadata).to eq new_metadata
      expect(@failover_backend.backends).to eq new_backends
    end
  end
end
