# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  ##
  # Low level class which allows the user to iterate through the results of a list API call
  class PagedIterator
    attr_accessor :page, :n
    attr_reader :client, :list_property

    def initialize(
      client:,
      page:,
      list_property:,
      danger: false
    )
      @n = 0
      @client = client
      @list_property = list_property
      @page = page
      @danger = danger
    end

    ##
    # Iterate through the result set, returning the next instance if we already have one, or make
    # a new API call to next_page_uri to get more results and return the next one from that call.
    #
    # @return [object] Returns an instance of a class.
    def get_next
      item = @page.attrs[@list_property][@n]
      raise "None" if item.nil?
      self.n += 1
      item
    rescue
      if @page.next_page_uri
        res = @client.list(danger: @danger, url: @page.next_page_uri)
        self.n = 0
        self.page = res
        get_next
      end
    end
  end
end
