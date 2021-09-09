require 'spec_helper'

RSpec.describe NgrokAPI::PagedIterator do
  before(:each) do
    client = class_double("ApiKeysClient")
    page = class_double("ApiKeyList")
    @paged_iterator = NgrokAPI::PagedIterator.new(client: client, result: result)
  end

  describe "#get_next" do
    pending "should ..." do
      expect(1).to eq 2
    end
  end
end
