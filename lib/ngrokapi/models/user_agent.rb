# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Models
    class UserAgent
      attr_reader :client,
        :attrs,
        :raw,
        :browser_name,
        :browser_version,
        :device_type,
        :os_name,
        :os_version

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @raw = @attrs['raw']
        @browser_name = @attrs['browser_name']
        @browser_version = @attrs['browser_version']
        @device_type = @attrs['device_type']
        @os_name = @attrs['os_name']
        @os_version = @attrs['os_version']
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
