# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointBackendMutate
      attr_reader :client,
        :result,
        :enabled,
        :backend_id

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @backend_id = @result['backend_id']
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
