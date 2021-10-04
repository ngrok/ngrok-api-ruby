require 'spec_helper'

RSpec.describe NgrokAPI::Services::AbuseReportsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/abuse_reports' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: abuse_report_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @abuse_reports_client = NgrokAPI::Services::AbuseReportsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::AbuseReport" do
      path = '/abuse_reports'
      replacements = {
      }
      data = {}
      data[:urls] = "New urls"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(abuse_report_result)
      result = @abuse_reports_client.create(
        urls: "New urls",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::AbuseReport)
      # expect(result.id).to eq(abuse_report_result["id"])
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::AbuseReport" do
      path = '/abuse_reports/%{id}'
      replacements = {
        id: abuse_report_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(abuse_report_result)
      result = @abuse_reports_client.get(
        id: abuse_report_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::AbuseReport)
      # expect(result.id).to eq(abuse_report_result["id"])
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::AbuseReport" do
      path = '/abuse_reports/%{id}'
      replacements = {
        id: abuse_report_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(abuse_report_result)
      result = @abuse_reports_client.get(
        id: abuse_report_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::AbuseReport)
      # expect(result.id).to eq(abuse_report_result["id"])
    end
  end
end
