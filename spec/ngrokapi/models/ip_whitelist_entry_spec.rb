require 'spec_helper'

RSpec.describe NgrokAPI::Models::IPWhitelistEntry do
  before(:each) do
    @client = class_double("IPWhitelistEntrysClient")
    @ip_whitelist_entry = NgrokAPI::Models::IPWhitelistEntry.new(client: @client, result: ip_whitelist_entry_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::IPWhitelistEntry.new(client: @client, result: ip_whitelist_entry_result)
      expect(@ip_whitelist_entry == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@ip_whitelist_entry.to_s).to eq ip_whitelist_entry_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@ip_whitelist_entry.client).to receive(:delete)
      @ip_whitelist_entry.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      expect(@ip_whitelist_entry.client).to receive(:update)
      @ip_whitelist_entry.update(
        description: new_description,
        metadata: new_metadata
      )
      expect(@ip_whitelist_entry.description).to eq new_description
      expect(@ip_whitelist_entry.metadata).to eq new_metadata
    end
  end
end
