# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'uri'

module NgrokAPI
  module Models
    class AgentIngress
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :description,
        :metadata,
        :domain,
        :ns_targets,
        :region_domains,
        :created_at,
        :certificate_management_policy,
        :certificate_management_status

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @domain = @attrs['domain']
        @ns_targets = @attrs['ns_targets']
        @region_domains = @attrs['region_domains']
        @created_at = @attrs['created_at']
        @certificate_management_policy = @attrs['certificate_management_policy']
        @certificate_management_status = @attrs['certificate_management_status']
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
      # Delete an Agent Ingress by ID
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update attributes of an Agent Ingress by ID.
      #
      # https://ngrok.com/docs/api#api-agent-ingresses-update
      def update(
        description: nil,
        metadata: nil,
        certificate_management_policy: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @certificate_management_policy = certificate_management_policy if certificate_management_policy
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          certificate_management_policy: certificate_management_policy
        )
      end
    end
  end
end
