# frozen_string_literal: true

module NgrokAPI
  module Models
    class AgentIngress
      attr_reader :client,
        :result,
        :id,
        :uri,
        :description,
        :metadata,
        :domain,
        :ns_targets,
        :region_domains,
        :created_at

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @description = @result['description']
        @metadata = @result['metadata']
        @domain = @result['domain']
        @ns_targets = @result['ns_targets']
        @region_domains = @result['region_domains']
        @created_at = @result['created_at']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
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
        metadata: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @client.update(
          id: @id,
          description: description,
          metadata: metadata
        )
      end
    end
  end
end
