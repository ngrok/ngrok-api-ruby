# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointOAuthGitHub
      attr_reader :client,
        :attrs,
        :client_id,
        :client_secret,
        :scopes,
        :email_addresses,
        :email_domains,
        :teams,
        :organizations

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @client_id = @attrs['client_id']
        @client_secret = @attrs['client_secret']
        @scopes = @attrs['scopes']
        @email_addresses = @attrs['email_addresses']
        @email_domains = @attrs['email_domains']
        @teams = @attrs['teams']
        @organizations = @attrs['organizations']
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
