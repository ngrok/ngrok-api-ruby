# frozen_string_literal: true

module NgrokAPI
  module Errors
    ##
    # Error representing a 404 not found
    class NotFoundError < StandardError
      attr_reader :response

      def initialize(msg: "Resource not found", response: nil)
        @response = response
        super(msg)
      end
    end
  end
end
