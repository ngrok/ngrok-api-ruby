# frozen_string_literal: true

module NgrokAPI
  module Models
    class Listable
      attr_reader :client,
        :klass,
        :iter,
        :items,
        :list_property,
        :next_page_uri,
        :result,
        :uri

      def initialize(client:, result:, list_property:, klass:)
        @client = client
        @result = result
        @list_property = list_property
        @next_page_uri = @result['next_page_uri']
        @uri = @result['uri']
        @items = @result[list_property].each do |result|
          klass.new(client: client, result: result)
        end
        @iter = NgrokAPI::PagedIterator.new(
          client: client,
          page: self,
          list_property: list_property
        )
      end

      # TODO: equality
      def ==(other)
      end

      # TODO: to_s
      def to_s
      end
    end
  end
end
