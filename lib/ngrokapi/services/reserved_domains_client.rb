# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # Reserved Domains are hostnames that you can listen for traffic on. Domains
    #  can be used to listen for http, https or tls traffic. You may use a domain
    #  that you own by creating a CNAME record specified in the returned resource.
    #  This CNAME record points traffic for that domain to ngrok's edge servers.
    #
    # https://ngrok.com/docs/api#api-reserved-domains
    class ReservedDomainsClient
      # The API path for the requests
      PATH = '/reserved_domains'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'reserved_domains'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new reserved domain.
      #
      # @param [string] domain hostname of the reserved domain
      # @param [string] region reserve the domain in this geographic ngrok datacenter. Optional, default is us. (au, eu, ap, us, jp, in, sa)
      # @param [string] description human-readable description of what this reserved domain will be used for
      # @param [string] metadata arbitrary user-defined machine-readable data of this reserved domain. Optional, max 4096 bytes.
      # @param [string] certificate_id ID of a user-uploaded TLS certificate to use for connections to targeting this domain. Optional, mutually exclusive with ``certificate_management_policy``.
      # @param [ReservedDomainCertPolicy] certificate_management_policy configuration for automatic management of TLS certificates for this domain, or null if automatic management is disabled. Optional, mutually exclusive with ``certificate_id``.
      # @return [NgrokAPI::Models::ReservedDomain] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-create
      def create(name: "", domain: "", region: "", description: "", metadata: "", http_endpoint_configuration_id: nil, https_endpoint_configuration_id: nil, certificate_id: nil, certificate_management_policy: nil)
        path = '/reserved_domains'
        replacements = {
        }
        data = {}
        data[:domain] = domain if domain
        data[:region] = region if region
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:certificate_id] = certificate_id if certificate_id
        data[:certificate_management_policy] = certificate_management_policy if certificate_management_policy
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::ReservedDomain.new(client: self, attrs: result)
      end

      ##
      # Create a new reserved domain.
      # Throws an exception if API error.
      #
      # @param [string] domain hostname of the reserved domain
      # @param [string] region reserve the domain in this geographic ngrok datacenter. Optional, default is us. (au, eu, ap, us, jp, in, sa)
      # @param [string] description human-readable description of what this reserved domain will be used for
      # @param [string] metadata arbitrary user-defined machine-readable data of this reserved domain. Optional, max 4096 bytes.
      # @param [string] certificate_id ID of a user-uploaded TLS certificate to use for connections to targeting this domain. Optional, mutually exclusive with ``certificate_management_policy``.
      # @param [ReservedDomainCertPolicy] certificate_management_policy configuration for automatic management of TLS certificates for this domain, or null if automatic management is disabled. Optional, mutually exclusive with ``certificate_id``.
      # @return [NgrokAPI::Models::ReservedDomain] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-create
      def create!(name: "", domain: "", region: "", description: "", metadata: "", http_endpoint_configuration_id: nil, https_endpoint_configuration_id: nil, certificate_id: nil, certificate_management_policy: nil)
        path = '/reserved_domains'
        replacements = {
        }
        data = {}
        data[:domain] = domain if domain
        data[:region] = region if region
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:certificate_id] = certificate_id if certificate_id
        data[:certificate_management_policy] = certificate_management_policy if certificate_management_policy
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::ReservedDomain.new(client: self, attrs: result)
      end

      ##
      # Delete a reserved domain.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete
      def delete(id: "")
        path = '/reserved_domains/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a reserved domain.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete
      def delete!(id: "")
        path = '/reserved_domains/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get the details of a reserved domain.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ReservedDomain] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-get
      def get(id: "")
        path = '/reserved_domains/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::ReservedDomain.new(client: self, attrs: result)
      end

      ##
      # Get the details of a reserved domain.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::ReservedDomain] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-get
      def get!(id: "")
        path = '/reserved_domains/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::ReservedDomain.new(client: self, attrs: result)
      end

      ##
      # List all reserved domains on this account.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-list
      def list(before_id: nil, limit: nil, url: nil)
        result = @client.list(
          before_id: before_id,
          limit: limit,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::ReservedDomain
        )
      end

      ##
      # List all reserved domains on this account.
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-list
      def list!(before_id: nil, limit: nil, url: nil)
        result = @client.list(
          before_id: before_id,
          limit: limit,
          danger: true,
          url: url,
          path: PATH
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::ReservedDomain,
          danger: true
        )
      end

      ##
      # Update the attributes of a reserved domain.
      #
      # @param [string] id
      # @param [string] description human-readable description of what this reserved domain will be used for
      # @param [string] metadata arbitrary user-defined machine-readable data of this reserved domain. Optional, max 4096 bytes.
      # @param [string] certificate_id ID of a user-uploaded TLS certificate to use for connections to targeting this domain. Optional, mutually exclusive with ``certificate_management_policy``.
      # @param [ReservedDomainCertPolicy] certificate_management_policy configuration for automatic management of TLS certificates for this domain, or null if automatic management is disabled. Optional, mutually exclusive with ``certificate_id``.
      # @return [NgrokAPI::Models::ReservedDomain] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-update
      def update(id: "", description: nil, metadata: nil, http_endpoint_configuration_id: nil, https_endpoint_configuration_id: nil, certificate_id: nil, certificate_management_policy: nil, region: nil)
        path = '/reserved_domains/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:certificate_id] = certificate_id if certificate_id
        data[:certificate_management_policy] = certificate_management_policy if certificate_management_policy
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::ReservedDomain.new(client: self, attrs: result)
      end

      ##
      # Update the attributes of a reserved domain.
      # Throws an exception if API error.
      #
      # @param [string] id
      # @param [string] description human-readable description of what this reserved domain will be used for
      # @param [string] metadata arbitrary user-defined machine-readable data of this reserved domain. Optional, max 4096 bytes.
      # @param [string] certificate_id ID of a user-uploaded TLS certificate to use for connections to targeting this domain. Optional, mutually exclusive with ``certificate_management_policy``.
      # @param [ReservedDomainCertPolicy] certificate_management_policy configuration for automatic management of TLS certificates for this domain, or null if automatic management is disabled. Optional, mutually exclusive with ``certificate_id``.
      # @return [NgrokAPI::Models::ReservedDomain] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-update
      def update!(id: "", description: nil, metadata: nil, http_endpoint_configuration_id: nil, https_endpoint_configuration_id: nil, certificate_id: nil, certificate_management_policy: nil, region: nil)
        path = '/reserved_domains/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:certificate_id] = certificate_id if certificate_id
        data[:certificate_management_policy] = certificate_management_policy if certificate_management_policy
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::ReservedDomain.new(client: self, attrs: result)
      end

      ##
      # Detach the certificate management policy attached to a reserved domain.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-certificate-management-policy
      def delete_certificate_management_policy(id: "")
        path = '/reserved_domains/%{id}/certificate_management_policy'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Detach the certificate management policy attached to a reserved domain.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-certificate-management-policy
      def delete_certificate_management_policy!(id: "")
        path = '/reserved_domains/%{id}/certificate_management_policy'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Detach the certificate attached to a reserved domain.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-certificate
      def delete_certificate(id: "")
        path = '/reserved_domains/%{id}/certificate'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Detach the certificate attached to a reserved domain.
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-reserved-domains-delete-certificate
      def delete_certificate!(id: "")
        path = '/reserved_domains/%{id}/certificate'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
