# frozen_string_literal: true

module NgrokAPI
  module Models
    ##
    # A resource representing data from the reserved_domains API
    class ReservedDomain
      attr_reader :id,
        :certificate,
        :certificate_management_policy,
        :certificate_management_status,
        :client,
        :cname_target,
        :created_at,
        :description,
        :domain,
        :http_endpoint_configuration,
        :https_endpoint_configuration,
        :metadata,
        :region,
        :result,
        :uri

      def initialize(client:, result:)
        @client = client
        @result = result
        @created_at = @result['created_at']
        @certificate = @result['certificate']
        @certificate_management_policy = @result['certificate_management_policy']
        @certificate_management_status = @result['certificate_management_status']
        @cname_target = @result['cname_target']
        @description = @result['description']
        @domain = @result['domain']
        @http_endpoint_configuration = @result['http_endpoint_configuration']
        @https_endpoint_configuration = @result['https_endpoint_configuration']
        @id = @result['id']
        @metadata = @result['metadata']
        @region = @result['region']
        @uri = @result['uri']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete this reserved domain.
      #
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete
      def delete
        @client.delete(id: @id)
      end

      ##
      # Update the attributes of this reserved domain.
      #
      # rubocop:disable LineLength
      # @param [string] description human-readable description of what this reserved domain will be used for
      # @param [string] metadata arbitrary user-defined machine-readable data of this reserved domain. Optional, max 4096 bytes.
      # @param [string] http_endpoint_configuration_id ID of an endpoint configuration of type http that will be used to handle inbound http traffic to this domain
      # @param [string] https_endpoint_configuration_id ID of an endpoint configuration of type https that will be used to handle inbound https traffic to this domain
      # @param [string] certificate_id ID of a user-uploaded TLS certificate to use for connections to targeting this domain. Optional, mutually exclusive with ``certificate_management_policy``.
      # @param [string] certificate_management_policy configuration for automatic management of TLS certificates for this domain, or null if automatic management is disabled. Optional, mutually exclusive with ``certificate_id``.
      # @return [NgrokAPI::Models::ReservedDomain] result from update request
      # rubocop:enable LineLength
      #
      # https://ngrok.com/docs/api#api-reserved-domains-update
      def update(
        certificate_id: nil,
        certificate_management_policy: nil,
        description: '',
        http_endpoint_configuration_id: nil,
        https_endpoint_configuration_id: nil,
        metadata: ''
      )
        if certificate_management_policy
          @certificate_management_policy = certificate_management_policy
        end
        @description = description if description
        @metadata = metadata if metadata
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          http_endpoint_configuration_id: http_endpoint_configuration_id,
          https_endpoint_configuration_id: https_endpoint_configuration_id,
          certificate_id: certificate_id,
          certificate_management_policy: certificate_management_policy
        )
        # TODO: update @certificate, etc?
        # @certificate = new_result['certificate'] if certificate_id && new_result['certificate']
        # if http_endpoint_configuration_id
        #   @http_endpoint_configuration_id = http_endpoint_configuration_id
        # end
        # if https_endpoint_configuration_id
        #   @https_endpoint_configuration_id = https_endpoint_configuration_id
        # end
      end

      ##
      # Detach the certificate attached from this reserved domain.
      #
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-certificate
      def delete_certificate
        @certificate = nil
        @client.delete_certificate(id: @id)
      end

      ##
      # Detach the certificate management policy attached from this reserved domain.
      #
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-certificate-management-policy
      def delete_certificate_management_policy
        @certificate_management_policy = nil
        @certificate_management_status = nil
        @client.delete_certificate_management_policy(id: @id)
      end

      ##
      # Detach the http endpoint configuration attached from this reserved domain.
      #
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-http-endpoint-config
      def delete_http_endpoint_config
        @http_endpoint_configuration = nil
        @client.delete_http_endpoint_config(id: @id)
      end

      ##
      # Detach the https endpoint configuration attached from this reserved domain.
      #
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-https-endpoint-config
      def delete_https_endpoint_config
        @https_endpoint_configuration = nil
        @client.delete_https_endpoint_config(id: @id)
      end

      ##
      # Restore the certificate attached to this reserved domain.
      # Only works if the @result is still present from a previous action
      #
      # @return [NgrokAPI::Models::ReservedDomain] result from update request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-update
      def restore_certificate
        @certificate = @result['certificate']
        @client.update(id: @id, certificate_id: @result['certificate']['id'])
      end

      ##
      # Restore the certificate management policy attached to this reserved domain.
      # Only works if the @result is still present from a previous action
      #
      # @return [NgrokAPI::Models::ReservedDomain] result from update request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-update
      def restore_certificate_management_policy
        @certificate_management_policy = @result['certificate_management_policy']
        @certificate_management_status = @result['certificate_management_status']
        @client.update(
          id: @id,
          certificate_management_policy: @result['certificate_management_policy']
        )
      end

      ##
      # Restore the http endpoint configuration attached to this reserved domain.
      # Only works if the @result is still present from a previous action
      #
      # @return [NgrokAPI::Models::ReservedDomain] result from update request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-update
      def restore_http_endpoint_config
        @http_endpoint_configuration = @result['http_endpoint_configuration']
        @client.update(
          id: @id,
          http_endpoint_configuration_id: @result['http_endpoint_configuration']['id']
        )
      end

      ##
      # Restore the https endpoint configuration attached to this reserved domain.
      # Only works if the @result is still present from a previous action
      #
      # @return [NgrokAPI::Models::ReservedDomain] result from update request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-update
      def restore_https_endpoint_config
        @https_endpoint_configuration = @result['https_endpoint_configuration']
        @client.update(
          id: @id,
          https_endpoint_configuration_id: @result['https_endpoint_configuration']['id']
        )
      end
    end
  end
end
