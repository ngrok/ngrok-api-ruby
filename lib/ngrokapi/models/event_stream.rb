# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventStream
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :metadata,
        :description,
        :fields,
        :event_type,
        :destination_ids,
        :sampling_rate

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @metadata = @result['metadata']
        @description = @result['description']
        @fields = @result['fields']
        @event_type = @result['event_type']
        @destination_ids = @result['destination_ids']
        @sampling_rate = @result['sampling_rate']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete an Event Stream. Associated Event Destinations will be preserved.
      #
      # https://ngrok.com/docs/api#api-event-streams-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of an Event Stream by ID.
      #
      # https://ngrok.com/docs/api#api-event-streams-update
      def update(
        metadata: nil,
        description: nil,
        fields: nil,
        destination_ids: nil,
        sampling_rate: nil
      )
        @metadata = metadata if metadata
        @description = description if description
        @fields = fields if fields
        @destination_ids = destination_ids if destination_ids
        @sampling_rate = sampling_rate if sampling_rate
        @client.update(
          id: @id,
          metadata: metadata,
          description: description,
          fields: fields,
          destination_ids: destination_ids,
          sampling_rate: sampling_rate
        )
      end
    end
  end
end
