# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::AbuseReportHostname do
  before(:each) do
    @client = class_double("AbuseReportHostnamesClient")
    @abuse_report_hostname = NgrokAPI::Models::AbuseReportHostname.new(client: @client, attrs: abuse_report_hostname_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::AbuseReportHostname.new(client: @client, attrs: abuse_report_hostname_result)
      expect(@abuse_report_hostname == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@abuse_report_hostname.to_s).to eq abuse_report_hostname_result.to_s
    end
  end
end
