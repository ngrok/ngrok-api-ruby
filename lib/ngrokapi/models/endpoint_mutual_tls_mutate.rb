# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointMutualTLSMutate
      attr_reader :client,
        :attrs,
        :enabled,
        :certificate_authority_ids

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @certificate_authority_ids = @attrs['certificate_authority_ids']
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
