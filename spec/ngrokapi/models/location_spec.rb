require 'spec_helper'

RSpec.describe NgrokAPI::Models::Location do
  before(:each) do
    @client = class_double("LocationsClient")
    @location = NgrokAPI::Models::Location.new(client: @client, attrs: location_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::Location.new(client: @client, attrs: location_result)
      expect(@location == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@location.to_s).to eq location_result.to_s
    end
  end
end
