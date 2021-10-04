# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventSubscription
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :metadata,
        :description,
        :sources,
        :destinations

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @metadata = @result['metadata']
        @description = @result['description']
        @sources = @result['sources']
        @destinations = @result['destinations']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete an Event Subscription.
      #
      # https://ngrok.com/docs/api#api-event-subscriptions-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
