# frozen_string_literal: true

module NgrokAPI
  module Models
    class IPWhitelistEntry
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :ip_net

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @ip_net = @result['ip_net']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete an IP whitelist entry.
      #
      # https://ngrok.com/docs/api#api-ip-whitelist-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of an IP whitelist entry by ID
      #
      # https://ngrok.com/docs/api#api-ip-whitelist-update
      def update(
        description: nil,
        metadata: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @client.update(
          id: @id,
          description: description,
          metadata: metadata
        )
      end
    end
  end
end
