# frozen_string_literal: true

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
        :result,
        :uri

      def initialize(danger: false, client:, result:, list_property:, klass:)
        @client = client
        @result = result
        @list_property = list_property
        @next_page_uri = @result['next_page_uri']
        @uri = @result['uri']
        @items = @result[list_property].map do |item|
          klass.new(client: client, result: item)
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
        @result == other.result
      end

      def to_s
        @result.to_s
      end
    end
  end
end
