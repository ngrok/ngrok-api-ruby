# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventTargetCloudwatchLogs
      attr_reader :client,
        :attrs,
        :auth,
        :log_group_arn

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @auth = @attrs['auth']
        @log_group_arn = @attrs['log_group_arn']
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
