# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointOAuthGitHub
      attr_reader :client,
        :result,
        :client_id,
        :client_secret,
        :scopes,
        :email_addresses,
        :email_domains,
        :teams,
        :organizations

      def initialize(client:, result:)
        @client = client
        @result = result
        @client_id = @result['client_id']
        @client_secret = @result['client_secret']
        @scopes = @result['scopes']
        @email_addresses = @result['email_addresses']
        @email_domains = @result['email_domains']
        @teams = @result['teams']
        @organizations = @result['organizations']
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
