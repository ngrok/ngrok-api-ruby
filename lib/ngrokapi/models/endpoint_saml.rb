# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointSAML
      attr_reader :client,
        :attrs,
        :enabled,
        :options_passthrough,
        :cookie_prefix,
        :inactivity_timeout,
        :maximum_duration,
        :idp_metadata_url,
        :idp_metadata,
        :force_authn,
        :allow_idp_initiated,
        :authorized_groups,
        :entity_id,
        :assertion_consumer_service_url,
        :single_logout_url,
        :request_signing_certificate_pem,
        :metadata_url,
        :nameid_format

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @options_passthrough = @attrs['options_passthrough']
        @cookie_prefix = @attrs['cookie_prefix']
        @inactivity_timeout = @attrs['inactivity_timeout']
        @maximum_duration = @attrs['maximum_duration']
        @idp_metadata_url = @attrs['idp_metadata_url']
        @idp_metadata = @attrs['idp_metadata']
        @force_authn = @attrs['force_authn']
        @allow_idp_initiated = @attrs['allow_idp_initiated']
        @authorized_groups = @attrs['authorized_groups']
        @entity_id = @attrs['entity_id']
        @assertion_consumer_service_url = @attrs['assertion_consumer_service_url']
        @single_logout_url = @attrs['single_logout_url']
        @request_signing_certificate_pem = @attrs['request_signing_certificate_pem']
        @metadata_url = @attrs['metadata_url']
        @nameid_format = @attrs['nameid_format']
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
