# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::Secret do
  before(:each) do
    @client = class_double("SecretsClient")
    @secret = NgrokAPI::Models::Secret.new(client: @client, attrs: secret_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::Secret.new(client: @client, attrs: secret_result)
      expect(@secret == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@secret.to_s).to eq secret_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@secret.client).to receive(:delete)
      @secret.delete
    end
  end
end
