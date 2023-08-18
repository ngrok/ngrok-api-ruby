# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    ##
    # A resource representing multiple instances from a given "list" API call
    class Listable
      include Enumerable

      attr_reader :client,
        :klass,
        :iter,
        :items,
        :list_property,
        :next_page_uri,
        :attrs,
        :uri

      def initialize(danger: false, client:, attrs:, list_property:, klass:)
        @client = client
        @attrs = attrs
        @list_property = list_property
        @next_page_uri = @attrs['next_page_uri']
        @uri = @attrs['uri']
        @items = @attrs[list_property].map do |item|
          klass.new(client: client, attrs: item)
        end
        @iter = NgrokAPI::PagedIterator.new(
          client: client,
          page: self,
          list_property: list_property,
          danger: danger
        )
      end

      def each
        item = @iter.get_next
        while item
          yield item
          item = @iter.get_next
        end
      end

      def ==(other)
        @attrs == other.attrs
      end

      def to_s
        @attrs.to_s
      end
    end
  end
end
