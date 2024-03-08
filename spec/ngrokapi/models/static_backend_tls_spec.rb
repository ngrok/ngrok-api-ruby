# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::StaticBackendTLS do
  before(:each) do
    @client = class_double("StaticBackendTLSsClient")
    @static_backend_tls = NgrokAPI::Models::StaticBackendTLS.new(client: @client, attrs: static_backend_tls_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::StaticBackendTLS.new(client: @client, attrs: static_backend_tls_result)
      expect(@static_backend_tls == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@static_backend_tls.to_s).to eq static_backend_tls_result.to_s
    end
  end
end
