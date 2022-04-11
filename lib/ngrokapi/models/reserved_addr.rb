# frozen_string_literal: true

module NgrokAPI
  module Models
    class ReservedAddr
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :addr,
        :region,
        :endpoint_configuration

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        @uri = @attrs['uri']
        @created_at = @attrs['created_at']
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @addr = @attrs['addr']
        @region = @attrs['region']
        @endpoint_configuration = @attrs['endpoint_configuration']
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
      # Delete a reserved address.
      #
      # https://ngrok.com/docs/api#api-reserved-addrs-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
