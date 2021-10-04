# frozen_string_literal: true

module NgrokAPI
  module Models
    class IPRestriction
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :enforced,
        :type,
        :ip_policies

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @enforced = @result['enforced']
        @type = @result['type']
        @ip_policies = @result['ip_policies']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete an IP restriction
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
