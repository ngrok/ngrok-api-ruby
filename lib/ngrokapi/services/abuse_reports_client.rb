# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # Abuse Reports allow you to submit take-down requests for URLs hosted by
    #  ngrok that violate ngrok's terms of service.
    #
    # https://ngrok.com/docs/api#api-abuse-reports
    class AbuseReportsClient
      # The API path for the requests
      PATH = '/abuse_reports'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Creates a new abuse report which will be reviewed by our system and abuse
      # response team. This API is only available to authorized accounts. Contact
      # abuse@ngrok.com to request access
      #
      # @param [List<uri (string)>] urls a list of URLs containing suspected abusive content
      # @param [string] metadata arbitrary user-defined data about this abuse report. Optional, max 4096 bytes.
      # @return [NgrokAPI::Models::AbuseReport] result from the API request
      #
      # https://ngrok.com/docs/api#api-abuse-reports-create
      def create(urls:, metadata: "")
        path = '/abuse_reports'
        replacements = {
        }
        data = {}
        data[:urls] = urls if urls
        data[:metadata] = metadata if metadata
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::AbuseReport.new(client: self, attrs: result)
      end

      ##
      # Creates a new abuse report which will be reviewed by our system and abuse
      # response team. This API is only available to authorized accounts. Contact
      # abuse@ngrok.com to request access
      # Throws an exception if API error.
      #
      # @param [List<uri (string)>] urls a list of URLs containing suspected abusive content
      # @param [string] metadata arbitrary user-defined data about this abuse report. Optional, max 4096 bytes.
      # @return [NgrokAPI::Models::AbuseReport] result from the API request
      #
      # https://ngrok.com/docs/api#api-abuse-reports-create
      def create!(urls:, metadata: "")
        path = '/abuse_reports'
        replacements = {
        }
        data = {}
        data[:urls] = urls if urls
        data[:metadata] = metadata if metadata
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::AbuseReport.new(client: self, attrs: result)
      end

      ##
      # Get the detailed status of abuse report by ID.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::AbuseReport] result from the API request
      #
      # https://ngrok.com/docs/api#api-abuse-reports-get
      def get(id: "")
        path = '/abuse_reports/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::AbuseReport.new(client: self, attrs: result)
      end

      ##
      # Get the detailed status of abuse report by ID.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::AbuseReport] result from the API request
      #
      # https://ngrok.com/docs/api#api-abuse-reports-get
      def get!(id: "")
        path = '/abuse_reports/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::AbuseReport.new(client: self, attrs: result)
      end
    end
  end
end
