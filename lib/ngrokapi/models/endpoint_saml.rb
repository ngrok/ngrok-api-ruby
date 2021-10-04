# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointSAML
      attr_reader :client,
        :result,
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

      def initialize(client:, result:)
        @client = client
        @result = result
        @enabled = @result['enabled']
        @options_passthrough = @result['options_passthrough']
        @cookie_prefix = @result['cookie_prefix']
        @inactivity_timeout = @result['inactivity_timeout']
        @maximum_duration = @result['maximum_duration']
        @idp_metadata_url = @result['idp_metadata_url']
        @idp_metadata = @result['idp_metadata']
        @force_authn = @result['force_authn']
        @allow_idp_initiated = @result['allow_idp_initiated']
        @authorized_groups = @result['authorized_groups']
        @entity_id = @result['entity_id']
        @assertion_consumer_service_url = @result['assertion_consumer_service_url']
        @single_logout_url = @result['single_logout_url']
        @request_signing_certificate_pem = @result['request_signing_certificate_pem']
        @metadata_url = @result['metadata_url']
        @nameid_format = @result['nameid_format']
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
