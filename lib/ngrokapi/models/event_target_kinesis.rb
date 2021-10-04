# frozen_string_literal: true

module NgrokAPI
  module Models
    class EventTargetKinesis
      attr_reader :client,
        :result,
        :auth,
        :stream_arn

      def initialize(client:, result:)
        @client = client
        @result = result
        @auth = @result['auth']
        @stream_arn = @result['stream_arn']
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
