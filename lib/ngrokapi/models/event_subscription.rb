# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventSubscription
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :metadata,
        :description,
        :sources,
        :destinations

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        @uri = @attrs['uri']
        @created_at = @attrs['created_at']
        @metadata = @attrs['metadata']
        @description = @attrs['description']
        @sources = @attrs['sources']
        @destinations = @attrs['destinations']
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
