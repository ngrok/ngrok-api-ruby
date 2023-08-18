# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-event-subscriptions
    class EventSubscriptionsClient
      # The API path for the requests
      PATH = '/event_subscriptions'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'event_subscriptions'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create an Event Subscription.
      #
      # @param [string] metadata Arbitrary customer supplied information intended to be machine readable. Optional, max 4096 chars.
      # @param [string] description Arbitrary customer supplied information intended to be human readable. Optional, max 255 chars.
      # @param [List<EventSourceReplace>] sources Sources containing the types for which this event subscription will trigger
      # @param [List<string>] destination_ids A list of Event Destination IDs which should be used for this Event Subscription.
      # @return [NgrokAPI::Models::EventSubscription] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-subscriptions-create
      def create(metadata: "", description: "", sources: [], destination_ids: [])
        path = '/event_subscriptions'
        replacements = {
        }
        data = {}
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:sources] = sources if sources
        data[:destination_ids] = destination_ids if destination_ids
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::EventSubscription.new(client: self, attrs: result)
      end

      ##
      # Create an Event Subscription.
      # Throws an exception if API error.
      #
      # @param [string] metadata Arbitrary customer supplied information intended to be machine readable. Optional, max 4096 chars.
      # @param [string] description Arbitrary customer supplied information intended to be human readable. Optional, max 255 chars.
      # @param [List<EventSourceReplace>] sources Sources containing the types for which this event subscription will trigger
      # @param [List<string>] destination_ids A list of Event Destination IDs which should be used for this Event Subscription.
      # @return [NgrokAPI::Models::EventSubscription] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-subscriptions-create
      def create!(metadata: "", description: "", sources: [], destination_ids: [])
        path = '/event_subscriptions'
        replacements = {
        }
        data = {}
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:sources] = sources if sources
        data[:destination_ids] = destination_ids if destination_ids
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EventSubscription.new(client: self, attrs: result)
      end

      ##
      # Delete an Event Subscription.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-subscriptions-delete
      def delete(id: "")
        path = '/event_subscriptions/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete an Event Subscription.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-subscriptions-delete
      def delete!(id: "")
        path = '/event_subscriptions/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get an Event Subscription by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EventSubscription] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-subscriptions-get
      def get(id: "")
        path = '/event_subscriptions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EventSubscription.new(client: self, attrs: result)
      end

      ##
      # Get an Event Subscription by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EventSubscription] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-subscriptions-get
      def get!(id: "")
        path = '/event_subscriptions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EventSubscription.new(client: self, attrs: result)
      end

      ##
      # List this Account's Event Subscriptions.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-subscriptions-list
      def list(before_id: nil, limit: nil, url: nil)
        result = @client.list(
          before_id: before_id,
          limit: limit,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::EventSubscription
        )
      end

      ##
      # List this Account's Event Subscriptions.
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-subscriptions-list
      def list!(before_id: nil, limit: nil, url: nil)
        result = @client.list(
          before_id: before_id,
          limit: limit,
          danger: true,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::EventSubscription,
          danger: true
        )
      end

      ##
      # Update an Event Subscription.
      #
      # @param [string] id Unique identifier for this Event Subscription.
      # @param [string] metadata Arbitrary customer supplied information intended to be machine readable. Optional, max 4096 chars.
      # @param [string] description Arbitrary customer supplied information intended to be human readable. Optional, max 255 chars.
      # @param [List<EventSourceReplace>] sources Sources containing the types for which this event subscription will trigger
      # @param [List<string>] destination_ids A list of Event Destination IDs which should be used for this Event Subscription.
      # @return [NgrokAPI::Models::EventSubscription] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-subscriptions-update
      def update(id: "", metadata: nil, description: nil, sources: nil, destination_ids: nil)
        path = '/event_subscriptions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:sources] = sources if sources
        data[:destination_ids] = destination_ids if destination_ids
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::EventSubscription.new(client: self, attrs: result)
      end

      ##
      # Update an Event Subscription.
      # Throws an exception if API error.
      #
      # @param [string] id Unique identifier for this Event Subscription.
      # @param [string] metadata Arbitrary customer supplied information intended to be machine readable. Optional, max 4096 chars.
      # @param [string] description Arbitrary customer supplied information intended to be human readable. Optional, max 255 chars.
      # @param [List<EventSourceReplace>] sources Sources containing the types for which this event subscription will trigger
      # @param [List<string>] destination_ids A list of Event Destination IDs which should be used for this Event Subscription.
      # @return [NgrokAPI::Models::EventSubscription] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-subscriptions-update
      def update!(id: "", metadata: nil, description: nil, sources: nil, destination_ids: nil)
        path = '/event_subscriptions/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:metadata] = metadata if metadata
        data[:description] = description if description
        data[:sources] = sources if sources
        data[:destination_ids] = destination_ids if destination_ids
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EventSubscription.new(client: self, attrs: result)
      end
    end
  end
end
