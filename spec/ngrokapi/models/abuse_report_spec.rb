require 'spec_helper'

RSpec.describe NgrokAPI::Models::AbuseReport do
  before(:each) do
    @client = class_double("AbuseReportsClient")
    @abuse_report = NgrokAPI::Models::AbuseReport.new(client: @client, result: abuse_report_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::AbuseReport.new(client: @client, result: abuse_report_result)
      expect(@abuse_report == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@abuse_report.to_s).to eq abuse_report_result.to_s
    end
  end
end
