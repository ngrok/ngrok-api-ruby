# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointOAuthProvider
      attr_reader :client,
        :result,
        :github,
        :facebook,
        :microsoft,
        :google

      def initialize(client:, result:)
        @client = client
        @result = result
        @github = @result['github']
        @facebook = @result['facebook']
        @microsoft = @result['microsoft']
        @google = @result['google']
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
