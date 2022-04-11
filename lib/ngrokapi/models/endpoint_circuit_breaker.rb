# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointCircuitBreaker
      attr_reader :client,
        :attrs,
        :enabled,
        :tripped_duration,
        :rolling_window,
        :num_buckets,
        :volume_threshold,
        :error_threshold_percentage

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @tripped_duration = @attrs['tripped_duration']
        @rolling_window = @attrs['rolling_window']
        @num_buckets = @attrs['num_buckets']
        @volume_threshold = @attrs['volume_threshold']
        @error_threshold_percentage = @attrs['error_threshold_percentage']
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
