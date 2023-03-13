# frozen_string_literal: true

require 'uri'

module NgrokAPI
  module Models
    class ReservedDomain
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :domain,
        :region,
        :cname_target,
        :http_endpoint_configuration,
        :https_endpoint_configuration,
        :certificate,
        :certificate_management_policy,
        :certificate_management_status,
        :acme_challenge_cname_target

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @created_at = @attrs['created_at']
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @domain = @attrs['domain']
        @region = @attrs['region']
        @cname_target = @attrs['cname_target']
        @http_endpoint_configuration = @attrs['http_endpoint_configuration']
        @https_endpoint_configuration = @attrs['https_endpoint_configuration']
        @certificate = @attrs['certificate']
        @certificate_management_policy = @attrs['certificate_management_policy']
        @certificate_management_status = @attrs['certificate_management_status']
        @acme_challenge_cname_target = @attrs['acme_challenge_cname_target']
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

      ##
      # Delete a reserved domain.
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
