# frozen_string_literal: true

module NgrokAPI
  module Models
    class ApiKeyList
      attr_reader :client,
        :keys,
        :iter,
        :next_page_uri,
        :result,
        :uri

      def initialize(client:, result:)
        @client = client
        @result = result
        @next_page_uri = @result['next_page_uri']
        @uri = @result['uri']
        @keys = @result['keys'].each do |key|
          NgrokAPI::Models::ApiKey.new(client: client, result: key)
        end
        @iter = NgrokAPI::PagedIterator.new(client: client, page: self, list_property: 'keys')
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
