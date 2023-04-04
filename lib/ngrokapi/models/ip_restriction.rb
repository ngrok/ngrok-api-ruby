# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class IPRestriction
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :enforced,
        :type,
        :ip_policies

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @created_at = @attrs['created_at']
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @enforced = @attrs['enforced']
        @type = @attrs['type']
        @ip_policies = @attrs['ip_policies']
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
      # Delete an IP restriction
      #
      # https://ngrok.com/docs/api#api-ip-restrictions-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
