# frozen_string_literal: true

module NgrokAPI
  module Models
    class BrowserSession
      attr_reader :client,
        :attrs,
        :user_agent,
        :ip_address,
        :location

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @user_agent = @attrs['user_agent']
        @ip_address = @attrs['ip_address']
        @location = @attrs['location']
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
