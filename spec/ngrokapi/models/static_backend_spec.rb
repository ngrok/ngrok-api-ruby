# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::StaticBackend do
  before(:each) do
    @client = class_double("StaticBackendsClient")
    @static_backend = NgrokAPI::Models::StaticBackend.new(client: @client, attrs: static_backend_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::StaticBackend.new(client: @client, attrs: static_backend_result)
      expect(@static_backend == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@static_backend.to_s).to eq static_backend_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@static_backend.client).to receive(:delete)
      @static_backend.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_address = 'New address'
      new_tls = 'New tls'
      expect(@static_backend.client).to receive(:update)
      @static_backend.update(
        description: new_description,
        metadata: new_metadata,
        address: new_address,
        tls: new_tls
      )
      expect(@static_backend.description).to eq new_description
      expect(@static_backend.metadata).to eq new_metadata
      expect(@static_backend.address).to eq new_address
      expect(@static_backend.tls).to eq new_tls
    end
  end
end
