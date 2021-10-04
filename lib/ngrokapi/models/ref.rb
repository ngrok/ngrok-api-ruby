# frozen_string_literal: true

module NgrokAPI
  module Models
    class Ref
      attr_reader :client,
        :result,
        :id,
        :uri

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
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
