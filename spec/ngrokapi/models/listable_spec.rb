require 'spec_helper'

RSpec.describe NgrokAPI::Models::Listable do
  before(:each) do
    client = class_double("ApiKeysClient")
    @result = {
      "keys"=> [
        {
          "id" => "ak_1xSR6lmGzdXyfOsubPGwnuaBUfN",
          "uri" => "https://api.ngrok.com/api_keys/ak_1xSR6lmGzdXyfOsubPGwnuaBUfN",
          "description" => "testkey",
          "metadata" => "Cool",
          "created_at" => "2021-08-30T17:58:49Z",
          "token" => nil
        },
        {
          "id" => "ak_1xrqAsg8fMHBgD71MSbtr6a0pA2",
          "uri" => "https://api.ngrok.com/api_keys/ak_1xrqAsg8fMHBgD71MSbtr6a0pA2",
          "description" => "",
          "metadata" => "",
          "created_at" => "2021-09-08T17:50:14Z",
          "token" => nil
        },
        {
          "id" => "ak_1xrq9HdabkhmGN4It9Lx7zuSUF2",
          "uri" => "https://api.ngrok.com/api_keys/ak_1xrq9HdabkhmGN4It9Lx7zuSUF2",
          "description" => "",
          "metadata" => "",
          "created_at" => "2021-09-08T17:50:01Z",
          "token" => nil
        }
      ],
      "uri" => "https://api.ngrok.com/api_keys",
      "next_page_uri" => nil
    }
    @listable = NgrokAPI::Models::Listable.new(
      client: client,
      result: @result,
      list_property: 'keys',
      klass: NgrokAPI::Models::ApiKey
    )
  end

  describe "#==" do
    pending "should be equal if X" do
      expect(1).to eq 2
    end
  end

  describe "#to_s" do
    pending "should stringify with X" do
      expect(1).to eq 2
    end
  end

  describe "keys" do
    it "should consistent of ApiKeys" do
      expect(@listable.items.size).to eq @result['keys'].size
    end
  end

  describe "iter" do
    it "should be a PagedIterator" do
      expect(@listable.iter.class).to eq NgrokAPI::PagedIterator
    end
  end
end
