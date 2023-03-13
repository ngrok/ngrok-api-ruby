# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class AbuseReport
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :urls,
        :metadata,
        :status,
        :hostnames

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @created_at = @attrs['created_at']
        @urls = @attrs['urls']
        @metadata = @attrs['metadata']
        @status = @attrs['status']
        @hostnames = @attrs['hostnames']
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
    end
  end
end
