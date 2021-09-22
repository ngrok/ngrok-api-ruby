# frozen_string_literal: true

module NgrokAPI
  ##
  # Base Error class for all Ngrok Errors
  class Error < StandardError
    attr_reader :response

    def initialize(msg: "An error occurred with the NgrokAPI", response: nil)
      @response = response
      super(msg)
    end
  end
end
