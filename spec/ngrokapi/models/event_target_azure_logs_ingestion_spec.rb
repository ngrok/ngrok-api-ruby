# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::EventTargetAzureLogsIngestion do
  before(:each) do
    @client = class_double("EventTargetAzureLogsIngestionsClient")
    @event_target_azure_logs_ingestion = NgrokAPI::Models::EventTargetAzureLogsIngestion.new(client: @client, attrs: event_target_azure_logs_ingestion_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::EventTargetAzureLogsIngestion.new(client: @client, attrs: event_target_azure_logs_ingestion_result)
      expect(@event_target_azure_logs_ingestion == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@event_target_azure_logs_ingestion.to_s).to eq event_target_azure_logs_ingestion_result.to_s
    end
  end
end
