require 'spec_helper'

RSpec.describe NgrokAPI::Models::AWSRole do
  before(:each) do
    @client = class_double("AWSRolesClient")
    @aws_role = NgrokAPI::Models::AWSRole.new(client: @client, attrs: aws_role_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::AWSRole.new(client: @client, attrs: aws_role_result)
      expect(@aws_role == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@aws_role.to_s).to eq aws_role_result.to_s
    end
  end
end
