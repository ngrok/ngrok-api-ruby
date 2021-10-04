require 'spec_helper'

RSpec.describe NgrokAPI::Models::Ref do
  before(:each) do
    @client = class_double("RefsClient")
    @ref = NgrokAPI::Models::Ref.new(client: @client, result: ref_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::Ref.new(client: @client, result: ref_result)
      expect(@ref == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@ref.to_s).to eq ref_result.to_s
    end
  end
end
