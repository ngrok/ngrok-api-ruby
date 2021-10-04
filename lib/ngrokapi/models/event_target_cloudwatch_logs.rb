# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventTargetCloudwatchLogs
      attr_reader :client,
        :result,
        :auth,
        :log_group_arn

      def initialize(client:, result:)
        @client = client
        @result = result
        @auth = @result['auth']
        @log_group_arn = @result['log_group_arn']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end
    end
  end
end
