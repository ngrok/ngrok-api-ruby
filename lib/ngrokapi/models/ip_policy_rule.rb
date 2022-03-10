# frozen_string_literal: true

module NgrokAPI
  module Models
    class IPPolicyRule
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :cidr,
        :ip_policy,
        :action

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @cidr = @result['cidr']
        @ip_policy = @result['ip_policy']
        @action = @result['action']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete an IP policy rule.
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of an IP policy rule by ID
      #
      # https://ngrok.com/docs/api#api-ip-policy-rules-update
      def update(
        description: nil,
        metadata: nil,
        cidr: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @cidr = cidr if cidr
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          cidr: cidr
        )
      end
    end
  end
end
