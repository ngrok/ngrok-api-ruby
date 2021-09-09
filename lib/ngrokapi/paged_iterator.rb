# frozen_string_literal: true

module NgrokAPI
  class PagedIterator
    attr_accessor :page, :n
    attr_reader :client, :list_property

    def initialize(
      client:,
      page:,
      list_property:
    )
      @n = 0
      @client = client
      @list_property = list_property
      @page = page
    end

    def get_next
      begin
        item = @page.result[@list_property][@n]
        raise "None" if item.nil?
        self.n += 1
        item
      rescue => exception
        if self.page.next_page_uri.nil?
          # Handle / raise exception
        else
          res = @client.list(url: @page.next_page_uri)
          self.n = 0
          self.page = res
          get_next
        end
      end
    end
  end
end
