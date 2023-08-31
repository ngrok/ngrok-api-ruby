# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Errors
    ##
    # Error representing a 404 not found
    class NotFoundError < NgrokAPI::Error
      attr_reader :response

      def initialize(msg: "Resource not found", response: nil)
        @response = response
        super(msg: msg, response: response)
      end
    end
  end
end
