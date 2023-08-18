# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EndpointWebhookValidation do
  before(:each) do
    @client = class_double("EndpointWebhookValidationsClient")
    @endpoint_webhook_validation = NgrokAPI::Models::EndpointWebhookValidation.new(client: @client, attrs: endpoint_webhook_validation_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EndpointWebhookValidation.new(client: @client, attrs: endpoint_webhook_validation_result)
      expect(@endpoint_webhook_validation == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@endpoint_webhook_validation.to_s).to eq endpoint_webhook_validation_result.to_s
    end
  end
end
