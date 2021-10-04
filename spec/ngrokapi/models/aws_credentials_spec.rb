require 'spec_helper'

RSpec.describe NgrokAPI::Models::AWSCredentials do
  before(:each) do
    @client = class_double("AWSCredentialssClient")
    @aws_credentials = NgrokAPI::Models::AWSCredentials.new(client: @client, result: aws_credentials_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::AWSCredentials.new(client: @client, result: aws_credentials_result)
      expect(@aws_credentials == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@aws_credentials.to_s).to eq aws_credentials_result.to_s
    end
  end
end
