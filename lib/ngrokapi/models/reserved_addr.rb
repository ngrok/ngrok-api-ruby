# frozen_string_literal: true

module NgrokAPI
  module Models
    class ReservedAddr
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :addr,
        :region,
        :endpoint_configuration

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @addr = @result['addr']
        @region = @result['region']
        @endpoint_configuration = @result['endpoint_configuration']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete a reserved address.
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
