# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-event-sources
    class EventSourcesClient
      # The API path for the requests
      PATH = '/event_subscriptions/%{subscription_id}/sources'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Add an additional type for which this event subscription will trigger
      #
      # @param [string] subscription_id The unique identifier for the Event Subscription that this Event Source is attached to.
      # @param [string] type Type of event for which an event subscription will trigger
      # @return [NgrokAPI::Models::EventSource] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-sources-create
      def create(subscription_id: "", type: "", filter: "", fields: [])
        path = '/event_subscriptions/%{subscription_id}/sources'
        replacements = {
          subscription_id: subscription_id,
        }
        data = {}
        data[:type] = type if type
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::EventSource.new(client: self, attrs: result)
      end

      ##
      # Add an additional type for which this event subscription will trigger
      # Throws an exception if API error.
      #
      # @param [string] subscription_id The unique identifier for the Event Subscription that this Event Source is attached to.
      # @param [string] type Type of event for which an event subscription will trigger
      # @return [NgrokAPI::Models::EventSource] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-sources-create
      def create!(subscription_id: "", type: "", filter: "", fields: [])
        path = '/event_subscriptions/%{subscription_id}/sources'
        replacements = {
          subscription_id: subscription_id,
        }
        data = {}
        data[:type] = type if type
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EventSource.new(client: self, attrs: result)
      end

      ##
      # Remove a type for which this event subscription will trigger
      #
      # @param [string] subscription_id The unique identifier for the Event Subscription that this Event Source is attached to.
      # @param [string] type Type of event for which an event subscription will trigger
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-sources-delete
      def delete(subscription_id: "", type: "")
        path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
        replacements = {
          subscription_id: subscription_id,
          type: type,
        }
        @client.delete(path % replacements)
      end

      ##
      # Remove a type for which this event subscription will trigger
      # Throws an exception if API error.
      #
      # @param [string] subscription_id The unique identifier for the Event Subscription that this Event Source is attached to.
      # @param [string] type Type of event for which an event subscription will trigger
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-sources-delete
      def delete!(subscription_id: "", type: "")
        path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
        replacements = {
          subscription_id: subscription_id,
          type: type,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get the details for a given type that triggers for the given event subscription
      #
      # @param [string] subscription_id The unique identifier for the Event Subscription that this Event Source is attached to.
      # @param [string] type Type of event for which an event subscription will trigger
      # @return [NgrokAPI::Models::EventSource] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-sources-get
      def get(subscription_id: "", type: "")
        path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
        replacements = {
          subscription_id: subscription_id,
          type: type,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EventSource.new(client: self, attrs: result)
      end

      ##
      # Get the details for a given type that triggers for the given event subscription
      # Throws an exception if API error.
      #
      # @param [string] subscription_id The unique identifier for the Event Subscription that this Event Source is attached to.
      # @param [string] type Type of event for which an event subscription will trigger
      # @return [NgrokAPI::Models::EventSource] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-sources-get
      def get!(subscription_id: "", type: "")
        path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
        replacements = {
          subscription_id: subscription_id,
          type: type,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EventSource.new(client: self, attrs: result)
      end

      ##
      # List the types for which this event subscription will trigger
      #
      # @param [string] subscription_id The unique identifier for the Event Subscription that this Event Source is attached to.
      # @return [NgrokAPI::Models::EventSourceList] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-sources-list
      def list(subscription_id: "")
        path = '/event_subscriptions/%{subscription_id}/sources'
        replacements = {
          subscription_id: subscription_id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EventSourceList.new(client: self, attrs: result)
      end

      ##
      # List the types for which this event subscription will trigger
      # Throws an exception if API error.
      #
      # @param [string] subscription_id The unique identifier for the Event Subscription that this Event Source is attached to.
      # @return [NgrokAPI::Models::EventSourceList] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-sources-list
      def list!(subscription_id: "")
        path = '/event_subscriptions/%{subscription_id}/sources'
        replacements = {
          subscription_id: subscription_id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EventSourceList.new(client: self, attrs: result)
      end

      ##
      # Update the type for which this event subscription will trigger
      #
      # @param [string] subscription_id The unique identifier for the Event Subscription that this Event Source is attached to.
      # @param [string] type Type of event for which an event subscription will trigger
      # @return [NgrokAPI::Models::EventSource] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-sources-update
      def update(subscription_id: "", type: "", filter: nil, fields: nil)
        path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
        replacements = {
          subscription_id: subscription_id,
          type: type,
        }
        data = {}
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::EventSource.new(client: self, attrs: result)
      end

      ##
      # Update the type for which this event subscription will trigger
      # Throws an exception if API error.
      #
      # @param [string] subscription_id The unique identifier for the Event Subscription that this Event Source is attached to.
      # @param [string] type Type of event for which an event subscription will trigger
      # @return [NgrokAPI::Models::EventSource] result from the API request
      #
      # https://ngrok.com/docs/api#api-event-sources-update
      def update!(subscription_id: "", type: "", filter: nil, fields: nil)
        path = '/event_subscriptions/%{subscription_id}/sources/%{type}'
        replacements = {
          subscription_id: subscription_id,
          type: type,
        }
        data = {}
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EventSource.new(client: self, attrs: result)
      end
    end
  end
end
