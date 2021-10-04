# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointSAMLMutate
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
