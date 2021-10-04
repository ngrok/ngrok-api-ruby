# frozen_string_literal: true

module NgrokAPI
  module Models
    class IPPolicy
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :action

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @action = @result['action']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
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
