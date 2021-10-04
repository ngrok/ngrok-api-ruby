# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointCircuitBreaker
      attr_reader :client,
        :result,
        :enabled,
        :tripped_duration,
        :rolling_window,
        :num_buckets,
        :volume_threshold,
        :error_threshold_percentage

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @tripped_duration = @result['tripped_duration']
        @rolling_window = @result['rolling_window']
        @num_buckets = @result['num_buckets']
        @volume_threshold = @result['volume_threshold']
        @error_threshold_percentage = @result['error_threshold_percentage']
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
