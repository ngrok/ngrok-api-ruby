require 'spec_helper'

RSpec.describe NgrokAPI::Models::AWSAuth do
  before(:each) do
    @client = class_double("AWSAuthsClient")
    @aws_auth = NgrokAPI::Models::AWSAuth.new(client: @client, result: aws_auth_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::AWSAuth.new(client: @client, result: aws_auth_result)
      expect(@aws_auth == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@aws_auth.to_s).to eq aws_auth_result.to_s
    end
  end
end
