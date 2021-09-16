require 'spec_helper'

RSpec.describe NgrokAPI::PagedIterator do
  let(:client) { class_double("ApiKeysClient") }
  let(:uri) { "https://api.ngrok.com/api_keys" }
  let(:next_page_uri) { "#{uri}?before_id=ak_1xuyYBCA83z5zo2MkBJ0JjvxPIs&limit=1" }
  let(:result) do
    {
      "id" => "ak_1xrq8h890dWRYiRdIHeZYCdlyT7",
      "uri" => "#{uri}/ak_1xrq8h890dWRYiRdIHeZYCdlyT7",
      "description" => "",
      "metadata" => "",
      "created_at" => "2021-09-08T17:49:56Z",
      "token" => nil,
    }
  end
  let(:results) do
    { "keys" => [result], "uri" => uri, "next_page_uri" => next_page_uri }
  end
  let(:empty_results) do
    { "keys" => [], "uri" => uri, "next_page_uri" => next_page_uri }
  end
  let(:empty_last_results) do
    { "keys" => [], "uri" => uri, "next_page_uri" => nil }
  end
  let(:item) { NgrokAPI::Models::ApiKey.new(client: client, result: result) }
  let(:page) do
    NgrokAPI::Models::Listable.new(
      client: client,
      result: results,
      list_property: 'keys',
      klass: NgrokAPI::Models::ApiKey
    )
  end
  let(:empty_page) do
    NgrokAPI::Models::Listable.new(
      client: client,
      result: empty_results,
      list_property: 'keys',
      klass: NgrokAPI::Models::ApiKey
    )
  end
  let(:empty_last_page) do
    NgrokAPI::Models::Listable.new(
      client: client,
      result: empty_last_results,
      list_property: 'keys',
      klass: NgrokAPI::Models::ApiKey
    )
  end

  describe "#get_next" do
    it "gets the next result from cache" do
      paged_iterator = NgrokAPI::PagedIterator.new(
        client: client,
        page: page,
        list_property: 'keys'
      )
      expect(page).not_to receive(:next_page_uri)
      expect(paged_iterator.get_next).to eq(result)
    end

    it "gets the next result based on next_page_uri if not in cache" do
      paged_iterator = NgrokAPI::PagedIterator.new(
        client: client,
        page: empty_page,
        list_property: 'keys'
      )
      expect(empty_page).to receive(:result).and_return(item)
      expect(empty_page).to receive(:next_page_uri)
      expect(paged_iterator.get_next).to eq(nil)
    end

    it "gets the next result based on next_page_uri if not in cache (with data)" do
      paged_iterator = NgrokAPI::PagedIterator.new(
        client: client,
        page: empty_page,
        list_property: 'keys'
      )
      expect(client).to receive(:list).with({ url: next_page_uri }).and_return(page)
      expect(paged_iterator.get_next).to eq(result)
    end

    it "gets the next result based on next_page_uri if not in cache (without data)" do
      paged_iterator = NgrokAPI::PagedIterator.new(
        client: client,
        page: empty_page,
        list_property: 'keys'
      )
      expect(client).to receive(:list).with({ url: next_page_uri }).and_return(empty_last_page)
      expect(paged_iterator.get_next).to eq(nil)
    end
  end
end
