# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-event-destinations
    class EventDestinationsClient
      # The API path for the requests
      PATH = '/event_destinations'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'event_destinations'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new Event Destination. It will not apply to anything until it is
      # associated with an Event Stream, and that Event Stream is associated with an
      # Endpoint Config.
      #
      # @param [string] metadata Arbitrary user-defined machine-readable data of this Event Destination. Optional, max 4096 bytes.
      # @param [string] description Human-readable description of the Event Destination. Optional, max 255 bytes.
      # @param [string] format The output format you would like to serialize events into when sending to their target. Currently the only accepted value is ``JSON``.
      # @param [EventTarget] target An object that encapsulates where and how to send your events. An event destination must contain exactly one of the following objects, leaving the rest null: ``kinesis``, ``firehose``, ``cloudwatch_logs``, or ``s3``.
      # @return [NgrokAPI::Models::EventDestination] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-destinations-create
      def create(metadata: "", description: "", format: "", target: nil, verify_with_test_event: nil)
        path = '/event_destinations'
        replacements = {
        }
        data = {}
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:format] = format if format
        data[:target] = target if target
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::EventDestination.new(client: self, result: result)
      end

      ##
      # Delete an Event Destination. If the Event Destination is still referenced by an
      # Event Stream, this will throw an error until that Event Stream has removed that
      # reference.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-destinations-delete
      def delete(id: "")
        path = '/event_destinations/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an Event Destination. If the Event Destination is still referenced by an
      # Event Stream, this will throw an error until that Event Stream has removed that
      # reference.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-destinations-delete
      def delete!(id: "")
        path = '/event_destinations/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get detailed information about an Event Destination by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EventDestination] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-destinations-get
      def get(id: "")
        path = '/event_destinations/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EventDestination.new(client: self, result: result)
      end

      ##
      # Get detailed information about an Event Destination by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EventDestination] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-destinations-get
      def get!(id: "")
        path = '/event_destinations/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EventDestination.new(client: self, result: result)
      end

      ##
      # List all Event Destinations on this account.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-destinations-list
      def list(before_id: nil, limit: nil,
               url: nil)
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
          klass: NgrokAPI::Models::EventDestination
        )
      end

      ##
      # List all Event Destinations on this account.
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-destinations-list
      def list!(before_id: nil, limit: nil,
                url: nil)
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
          klass: NgrokAPI::Models::EventDestination,
          danger: true
        )
      end

      ##
      # Update attributes of an Event Destination.
      #
      # @param [string] id Unique identifier for this Event Destination.
      # @param [string] metadata Arbitrary user-defined machine-readable data of this Event Destination. Optional, max 4096 bytes.
      # @param [string] description Human-readable description of the Event Destination. Optional, max 255 bytes.
      # @param [string] format The output format you would like to serialize events into when sending to their target. Currently the only accepted value is ``JSON``.
      # @param [EventTarget] target An object that encapsulates where and how to send your events. An event destination must contain exactly one of the following objects, leaving the rest null: ``kinesis``, ``firehose``, ``cloudwatch_logs``, or ``s3``.
      # @return [NgrokAPI::Models::EventDestination] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-destinations-update
      def update(id: "", metadata: nil, description: nil, format: nil, target: nil, verify_with_test_event: nil)
        path = '/event_destinations/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:format] = format if format
        data[:target] = target if target
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::EventDestination.new(client: self, result: result)
      end

      ##
      # Update attributes of an Event Destination.
      # Throws an exception if API error.
      #
      # @param [string] id Unique identifier for this Event Destination.
      # @param [string] metadata Arbitrary user-defined machine-readable data of this Event Destination. Optional, max 4096 bytes.
      # @param [string] description Human-readable description of the Event Destination. Optional, max 255 bytes.
      # @param [string] format The output format you would like to serialize events into when sending to their target. Currently the only accepted value is ``JSON``.
      # @param [EventTarget] target An object that encapsulates where and how to send your events. An event destination must contain exactly one of the following objects, leaving the rest null: ``kinesis``, ``firehose``, ``cloudwatch_logs``, or ``s3``.
      # @return [NgrokAPI::Models::EventDestination] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-destinations-update
      def update!(id: "", metadata: nil, description: nil, format: nil, target: nil, verify_with_test_event: nil)
        path = '/event_destinations/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:format] = format if format
        data[:target] = target if target
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EventDestination.new(client: self, result: result)
      end
    end
  end
end
