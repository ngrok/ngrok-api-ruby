# frozen_string_literal: true

module NgrokAPI
  module Models
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

      # TODO: equality
      def ==(other)
      end

      # TODO: to_s
      def to_s
      end

      def delete
        @client.delete(id: @id)
      end

      def update(
        certificate_id: nil,
        certificate_management_policy: nil,
        description: '',
        http_endpoint_configuration_id: nil,
        https_endpoint_configuration_id: nil,
        metadata: ''
      )
        @certificate_id = certificate_id if certificate_id
        if certificate_management_policy
          @certificate_management_policy = certificate_management_policy
        end
        @description = description if description
        if http_endpoint_configuration_id
          @http_endpoint_configuration_id = http_endpoint_configuration_id
        end
        if https_endpoint_configuration_id
          @https_endpoint_configuration_id = https_endpoint_configuration_id
        end
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
      end

      def delete_certificate(id: nil)
        @certificate = nil
        @client.delete_certificate(id: @id)
      end

      def delete_certificate_management_policy(id: nil)
        @certificate_management_policy = nil
        @certificate_management_status = nil
        @client.delete_certificate_management_policy(id: @id)
      end

      def delete_http_endpoint_config(id: nil)
        @http_endpoint_configuration = nil
        @client.delete_http_endpoint_config(id: @id)
      end

      def delete_https_endpoint_config(id: nil)
        @https_endpoint_configuration = nil
        @client.delete_https_endpoint_config(id: @id)
      end

      def restore_certificate
        @certificate = @result['certificate']
        @client.update(id: @id, certificate_id: @result['certificate']['id'])
      end

      def restore_certificate_management_policy
        @certificate_management_policy = @result['certificate_management_policy']
        @certificate_management_status = @result['certificate_management_status']
        @client.update(
          id: @id,
          certificate_management_policy: @result['certificate_management_policy']
        )
      end

      def restore_http_endpoint_config
        @http_endpoint_configuration = @result['http_endpoint_configuration']
        @client.update(
          id: @id,
          http_endpoint_configuration_id: @result['http_endpoint_configuration']['id']
        )
      end

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
