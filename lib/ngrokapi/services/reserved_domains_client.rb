# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # A client for interacting with the reserved_domains API
    #
    # https://ngrok.com/docs/api#api-reserved-domains
    class ReservedDomainsClient
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'reserved_domains'
      # The API path for reserved domains
      PATH = '/reserved_domains'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      # rubocop:disable LineLength

      ##
      # Create a new reserved domain.
      #
      # @param [string] name the domain name to reserve. It may be a full domain name like app.example.com. If the name does not contain a '.' it will reserve that subdomain on ngrok.io.
      # @param [string] region reserve the domain in this geographic ngrok datacenter. Optional, default is us. (au, eu, ap, us, jp, in, sa)
      # @param [string] description human-readable description of what this reserved domain will be used for
      # @param [string] metadata arbitrary user-defined machine-readable data of this reserved domain. Optional, max 4096 bytes.
      # @param [string] http_endpoint_configuration_id ID of an endpoint configuration of type http that will be used to handle inbound http traffic to this domain
      # @param [string] https_endpoint_configuration_id ID of an endpoint configuration of type https that will be used to handle inbound https traffic to this domain
      # @param [string] certificate_id ID of a user-uploaded TLS certificate to use for connections to targeting this domain. Optional, mutually exclusive with ``certificate_management_policy``.
      # @param [string] certificate_management_policy configuration for automatic management of TLS certificates for this domain, or null if automatic management is disabled. Optional, mutually exclusive with ``certificate_id``.
      # @return [NgrokAPI::Models::ReservedDomain] result from create request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-create
      def create(
        name: '',
        region: '',
        description: '',
        metadata: '',
        http_endpoint_configuration_id: '',
        https_endpoint_configuration_id: '',
        certificate_id: nil,
        certificate_management_policy: nil
      )
        data = {
          name: name,
          region: region,
          description: description,
          metadata: metadata,
          http_endpoint_configuration_id: http_endpoint_configuration_id,
          https_endpoint_configuration_id: https_endpoint_configuration_id,
          certificate_id: certificate_id,
          certificate_management_policy: certificate_management_policy,
        }
        result = @client.post(PATH, data: data)
        NgrokAPI::Models::ReservedDomain.new(client: self, result: result)
      end
      # rubocop:enable LineLength

      ##
      # Delete a reserved domain.
      #
      # @param [string] id a resource identifier
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete
      def delete(id: nil)
        @client.delete("#{PATH}/#{id}")
      end

      ##
      # Get the details of a reserved domain.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ReservedDomain] result from get request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-get
      def get(id: nil)
        result = @client.get("#{PATH}/#{id}")
        NgrokAPI::Models::ReservedDomain.new(client: self, result: result)
      end

      ##
      # List all reserved domains on this account.
      #
      # @param [string] before_id
      # @param [integer] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from list request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-list
      def list(before_id: nil, limit: nil, url: nil)
        result = @client.list(before_id: before_id, limit: limit, url: url, path: PATH)
        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::ReservedDomain
        )
      end

      # rubocop:disable LineLength

      ##
      # Update the attributes of a reserved domain.
      #
      # @param [string] id
      # @param [string] description human-readable description of what this reserved domain will be used for
      # @param [string] metadata arbitrary user-defined machine-readable data of this reserved domain. Optional, max 4096 bytes.
      # @param [string] http_endpoint_configuration_id ID of an endpoint configuration of type http that will be used to handle inbound http traffic to this domain
      # @param [string] https_endpoint_configuration_id ID of an endpoint configuration of type https that will be used to handle inbound https traffic to this domain
      # @param [string] certificate_id ID of a user-uploaded TLS certificate to use for connections to targeting this domain. Optional, mutually exclusive with ``certificate_management_policy``.
      # @param [string] certificate_management_policy configuration for automatic management of TLS certificates for this domain, or null if automatic management is disabled. Optional, mutually exclusive with ``certificate_id``.
      # @return [NgrokAPI::Models::ReservedDomain] result from update request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-update
      def update(
        id: nil,
        certificate_id: nil,
        certificate_management_policy: nil,
        description: nil,
        http_endpoint_configuration_id: nil,
        https_endpoint_configuration_id: nil,
        metadata: nil
      )
        data = {}
        data[:certificate_id] = certificate_id if certificate_id
        if certificate_management_policy
          data[:certificate_management_policy] = certificate_management_policy
        end
        data[:description] = description if description
        if http_endpoint_configuration_id
          data[:http_endpoint_configuration_id] = http_endpoint_configuration_id
        end
        if https_endpoint_configuration_id
          data[:https_endpoint_configuration_id] = https_endpoint_configuration_id
        end
        data[:metadata] = metadata if metadata
        result = @client.patch("#{PATH}/#{id}", data: data)
        NgrokAPI::Models::ReservedDomain.new(client: self, result: result)
      end
      # rubocop:enable LineLength

      ##
      # Detach the certificate attached from a reserved domain.
      #
      # @param [string] id a resource identifier
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-certificate
      def delete_certificate(id: nil)
        @client.delete("#{PATH}/#{id}/certificate")
      end

      ##
      # Detach the certificate management policy attached from a reserved domain.
      #
      # @param [string] id a resource identifier
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-certificate-management-policy
      def delete_certificate_management_policy(id: nil)
        @client.delete("#{PATH}/#{id}/certificate_management_policy")
      end

      ##
      # Detach the http endpoint configuration attached from a reserved domain.
      #
      # @param [string] id a resource identifier
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-http-endpoint-config
      def delete_http_endpoint_config(id: nil)
        @client.delete("#{PATH}/#{id}/http_endpoint_configuration")
      end

      ##
      # Detach the https endpoint configuration attached from a reserved domain.
      #
      # @param [string] id a resource identifier
      # @return [nil] result from delete request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-https-endpoint-config
      def delete_https_endpoint_config(id: nil)
        @client.delete("#{PATH}/#{id}/https_endpoint_configuration")
      end
    end
  end
end
