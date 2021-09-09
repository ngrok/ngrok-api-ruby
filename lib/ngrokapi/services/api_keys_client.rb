# frozen_string_literal: true

module NgrokAPI
  module Services
    class ApiKeysClient
      PATH = '/api_keys'.freeze

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      def create(description: '', metadata: '')
        data = {
          description: description,
          metadata: metadata,
        }
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
          data[:before_id] = before_id unless before_id.nil?
          data[:limit] = limit unless limit.nil?
          @client.get(PATH, data: data)
        else
          @client.get(url)
        end
        NgrokAPI::Models::ApiKeyList.new(client: self, result: result)
      end

      def update(id: nil, description: '', metadata: '')
        data = {
          description: description,
          metadata: metadata,
        }
        result = @client.patch("#{PATH}/#{id}", data: data)
        NgrokAPI::Models::ApiKey.new(client: self, result: result)
      end
    end
  end
end
