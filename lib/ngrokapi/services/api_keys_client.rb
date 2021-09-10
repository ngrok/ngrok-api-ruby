# frozen_string_literal: true

module NgrokAPI
  module Services
    class ApiKeysClient
      LIST_PROPERTY = 'keys'.freeze
      PATH = '/api_keys'.freeze

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      def create(description: nil, metadata: nil)
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.post(PATH, data: data)
        NgrokAPI::Models::ApiKey.new(client: self, result: result)
      end

      def delete(id: nil)
        @client.delete("#{PATH}/#{id}")
      end

      def get(id: nil)
        result = @client.get("#{PATH}/#{id}")
        NgrokAPI::Models::ApiKey.new(client: self, result: result)
      end

      def list(before_id: nil, limit: nil, url: nil)
        result = if url.nil?
          data = {}
          data[:before_id] = before_id if before_id
          data[:limit] = limit if limit
          @client.get(PATH, data: data)
        else
          @client.get(url)
        end
        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::ApiKey
        )
      end

      def update(id: nil, description: nil, metadata: nil)
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        result = @client.patch("#{PATH}/#{id}", data: data)
        NgrokAPI::Models::ApiKey.new(client: self, result: result)
      end
    end
  end
end
