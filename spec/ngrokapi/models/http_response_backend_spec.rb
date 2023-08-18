# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::HTTPResponseBackend do
  before(:each) do
    @client = class_double("HTTPResponseBackendsClient")
    @http_response_backend = NgrokAPI::Models::HTTPResponseBackend.new(client: @client, attrs: http_response_backend_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::HTTPResponseBackend.new(client: @client, attrs: http_response_backend_result)
      expect(@http_response_backend == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@http_response_backend.to_s).to eq http_response_backend_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@http_response_backend.client).to receive(:delete)
      @http_response_backend.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_body = 'New body'
      new_headers = 'New headers'
      new_status_code = 'New status_code'
      expect(@http_response_backend.client).to receive(:update)
      @http_response_backend.update(
        description: new_description,
        metadata: new_metadata,
        body: new_body,
        headers: new_headers,
        status_code: new_status_code
      )
      expect(@http_response_backend.description).to eq new_description
      expect(@http_response_backend.metadata).to eq new_metadata
      expect(@http_response_backend.body).to eq new_body
      expect(@http_response_backend.headers).to eq new_headers
      expect(@http_response_backend.status_code).to eq new_status_code
    end
  end
end
