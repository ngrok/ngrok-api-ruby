require 'spec_helper'

RSpec.describe NgrokAPI::Models::Listable do
  before(:each) do
    @client = class_double("ApiKeysClient")
    @listable = NgrokAPI::Models::Listable.new(
      client: @client,
      result: api_key_results,
      list_property: 'keys',
      klass: NgrokAPI::Models::ApiKey
    )
  end

  describe "#==" do
    it "is equal if the results are the same" do
      listable2 = NgrokAPI::Models::Listable.new(
        client: @client,
        result: api_key_results,
        list_property: 'keys',
        klass: NgrokAPI::Models::ApiKey
      )
      expect(@listable == listable2).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@listable.to_s).to eq api_key_results.to_s
    end
  end

  describe "keys" do
    it "consistent of ApiKeys" do
      expect(@listable.items.size).to eq api_key_results['keys'].size
    end
  end

  describe "iter" do
    it "is a PagedIterator" do
      expect(@listable.iter.class).to eq NgrokAPI::PagedIterator
    end
  end
end
