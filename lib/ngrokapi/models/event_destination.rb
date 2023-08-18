# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'uri'

module NgrokAPI
  module Models
    class EventDestination
      attr_reader :client,
        :attrs,
        :id,
        :metadata,
        :created_at,
        :description,
        :format,
        :target,
        :uri

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        @metadata = @attrs['metadata']
        @created_at = @attrs['created_at']
        @description = @attrs['description']
        @format = @attrs['format']
        @target = @attrs['target']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
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
