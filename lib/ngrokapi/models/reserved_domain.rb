# frozen_string_literal: true

module NgrokAPI
  module Models
    class ReservedDomain
      attr_reader :client,
        :result,
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
        :certificate_management_status

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @domain = @result['domain']
        @region = @result['region']
        @cname_target = @result['cname_target']
        @http_endpoint_configuration = @result['http_endpoint_configuration']
        @https_endpoint_configuration = @result['https_endpoint_configuration']
        @certificate = @result['certificate']
        @certificate_management_policy = @result['certificate_management_policy']
        @certificate_management_status = @result['certificate_management_status']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
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
