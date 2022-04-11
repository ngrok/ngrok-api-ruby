# frozen_string_literal: true

module NgrokAPI
  module Models
    class IPPolicy
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :action

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        @uri = @attrs['uri']
        @created_at = @attrs['created_at']
        @description = @attrs['description']
        @metadata = @attrs['metadata']
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
      # Delete an IP policy. If the IP policy is referenced by another object for the
      # purposes of traffic restriction it will be treated as if the IP policy remains
      # but has zero rules.
      #
      # https://ngrok.com/docs/api#api-ip-policies-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of an IP policy by ID
      #
      # https://ngrok.com/docs/api#api-ip-policies-update
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
