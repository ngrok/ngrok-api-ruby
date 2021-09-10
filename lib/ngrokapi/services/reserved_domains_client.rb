# frozen_string_literal: true

module NgrokAPI
  module Services
    class ReservedDomainsClient
      LIST_PROPERTY = 'reserved_domains'.freeze
      PATH = '/reserved_domains'.freeze

      attr_reader :client

      def initialize(client:)
        @client = client
      end

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

      def delete(id: nil)
        @client.delete("#{PATH}/#{id}")
      end

      def get(id: nil)
        result = @client.get("#{PATH}/#{id}")
        NgrokAPI::Models::ReservedDomain.new(client: self, result: result)
      end

      def list(before_id: nil, limit: nil, url: nil)
        result = if url.nil?
          data = {}
          data[:before_id] = before_id if before_id
          data[:limit] = limit if limit
          @client.get(PATH, data: data)
        else
          @client.get(url)
        end
        NgrokAPI::Models::Listable.new(
          client: self,
          result: result,
          list_property: LIST_PROPERTY,
          klass: NgrokAPI::Models::ReservedDomain
        )
      end

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

      def delete_certificate_management_policy(id: nil)
        @client.delete("#{PATH}/#{id}/certificate_management_policy")
      end

      def delete_certificate(id: nil)
        @client.delete("#{PATH}/#{id}/certificate")
      end

      def delete_http_endpoint_config(id: nil)
        @client.delete("#{PATH}/#{id}/http_endpoint_configuration")
      end

      def delete_https_endpoint_config(id: nil)
        @client.delete("#{PATH}/#{id}/https_endpoint_configuration")
      end
    end
  end
end
