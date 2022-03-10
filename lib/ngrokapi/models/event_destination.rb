# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventDestination
      attr_reader :client,
        :result,
        :id,
        :metadata,
        :created_at,
        :description,
        :format,
        :target,
        :uri

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @metadata = @result['metadata']
        @created_at = @result['created_at']
        @description = @result['description']
        @format = @result['format']
        @target = @result['target']
        @uri = @result['uri']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete an Event Destination. If the Event Destination is still referenced by an
      # Event Subscription.
      #
      # https://ngrok.com/docs/api#api-event-destinations-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
