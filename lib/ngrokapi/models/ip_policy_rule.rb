# frozen_string_literal: true

module NgrokAPI
  module Models
    class IPPolicyRule
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :cidr,
        :ip_policy,
        :action

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        @uri = @attrs['uri']
        @created_at = @attrs['created_at']
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @cidr = @attrs['cidr']
        @ip_policy = @attrs['ip_policy']
        @action = @attrs['action']
      end

      def ==(other)
        @attrs == other.attrs
      end

      def to_s
        @attrs.to_s
      end

      def to_h
        @attrs.to_h
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
