# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-event-streams
    class EventStreamsClient
      # The API path for the requests
      PATH = '/event_streams'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'event_streams'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new Event Stream. It will not apply to anything until you associate it
      # with one or more Endpoint Configs.
      #
      # @param [string] metadata Arbitrary user-defined machine-readable data of this Event Stream. Optional, max 4096 bytes.
      # @param [string] description Human-readable description of the Event Stream. Optional, max 255 bytes.
      # @param [List<string>] fields A list of protocol-specific fields you want to collect on each event.
      # @param [string] event_type The protocol that determines which events will be collected. Supported values are ``tcp_connection_closed`` and ``http_request_complete``.
      # @param [List<string>] destination_ids A list of Event Destination IDs which should be used for this Event Stream. Event Streams are required to have at least one Event Destination.
      # @param [float64] sampling_rate The percentage of all events you would like to capture. Valid values range from 0.01, representing 1% of all events to 1.00, representing 100% of all events.
      # @return [NgrokAPI::Models::EventStream] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-streams-create
      def create(
        metadata: "",
        description: "",
        fields: [],
        event_type: "",
        destination_ids: [],
        sampling_rate: 0
      )
        path = '/event_streams'
        replacements = {
        }
        data = {}
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:fields] = fields if fields
        data[:event_type] = event_type if event_type
        data[:destination_ids] = destination_ids if destination_ids
        data[:sampling_rate] = sampling_rate if sampling_rate
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::EventStream.new(client: self, result: result)
      end

      ##
      # Delete an Event Stream. Associated Event Destinations will be preserved.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-streams-delete
      def delete(
        id: ""
      )
        path = '/event_streams/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an Event Stream. Associated Event Destinations will be preserved.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-streams-delete
      def delete!(
        id: ""
      )
        path = '/event_streams/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about an Event Stream by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EventStream] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-streams-get
      def get(
        id: ""
      )
        path = '/event_streams/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EventStream.new(client: self, result: result)
      end

      ##
      # Get detailed information about an Event Stream by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EventStream] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-streams-get
      def get!(
        id: ""
      )
        path = '/event_streams/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EventStream.new(client: self, result: result)
      end

      ##
      # List all Event Streams available on this account.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-streams-list
      def list(
        before_id: nil,
        limit: nil,
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::EventStream
        )
      end

      ##
      # List all Event Streams available on this account.
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-streams-list
      def list!(
        before_id: nil,
        limit: nil,
        url: nil
      )
        result = @client.list(
          before_id: before_id,
          limit: limit,
          danger: true,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::EventStream,
          danger: true
        )
      end

      ##
      # Update attributes of an Event Stream by ID.
      #
      # @param [string] id Unique identifier for this Event Stream.
      # @param [string] metadata Arbitrary user-defined machine-readable data of this Event Stream. Optional, max 4096 bytes.
      # @param [string] description Human-readable description of the Event Stream. Optional, max 255 bytes.
      # @param [List<string>] fields A list of protocol-specific fields you want to collect on each event.
      # @param [List<string>] destination_ids A list of Event Destination IDs which should be used for this Event Stream. Event Streams are required to have at least one Event Destination.
      # @param [float64] sampling_rate The percentage of all events you would like to capture. Valid values range from 0.01, representing 1% of all events to 1.00, representing 100% of all events.
      # @return [NgrokAPI::Models::EventStream] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-streams-update
      def update(
        id: "",
        metadata: nil,
        description: nil,
        fields: nil,
        destination_ids: nil,
        sampling_rate: nil
      )
        path = '/event_streams/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:fields] = fields if fields
        data[:destination_ids] = destination_ids if destination_ids
        data[:sampling_rate] = sampling_rate if sampling_rate
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::EventStream.new(client: self, result: result)
      end

      ##
      # Update attributes of an Event Stream by ID.
      # Throws an exception if API error.
      #
      # @param [string] id Unique identifier for this Event Stream.
      # @param [string] metadata Arbitrary user-defined machine-readable data of this Event Stream. Optional, max 4096 bytes.
      # @param [string] description Human-readable description of the Event Stream. Optional, max 255 bytes.
      # @param [List<string>] fields A list of protocol-specific fields you want to collect on each event.
      # @param [List<string>] destination_ids A list of Event Destination IDs which should be used for this Event Stream. Event Streams are required to have at least one Event Destination.
      # @param [float64] sampling_rate The percentage of all events you would like to capture. Valid values range from 0.01, representing 1% of all events to 1.00, representing 100% of all events.
      # @return [NgrokAPI::Models::EventStream] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-streams-update
      def update!(
        id: "",
        metadata: nil,
        description: nil,
        fields: nil,
        destination_ids: nil,
        sampling_rate: nil
      )
        path = '/event_streams/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:fields] = fields if fields
        data[:destination_ids] = destination_ids if destination_ids
        data[:sampling_rate] = sampling_rate if sampling_rate
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EventStream.new(client: self, result: result)
      end
    end
  end
end
