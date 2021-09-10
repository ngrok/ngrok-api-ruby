# frozen_string_literal: true

module NgrokAPI
  module Services
    class EndpointConfigurationsClient
      LIST_PROPERTY = 'endpoint_configurations'.freeze
      PATH = '/endpoint_configurations'.freeze

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      def create(
        description: '',
        metadata: '',
        type: ''
      )
        data = {
          type: type,
          description: description,
          metadata: metadata,
        }
        result = @client.post(PATH, data: data)
        NgrokAPI::Models::EndpointConfiguration.new(client: self, result: result)
      end

      def delete(id: nil)
        @client.delete("#{PATH}/#{id}")
      end

      def get(id: nil)
        result = @client.get("#{PATH}/#{id}")
        NgrokAPI::Models::EndpointConfiguration.new(client: self, result: result)
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
          klass: NgrokAPI::Models::EndpointConfiguration
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
        NgrokAPI::Models::EndpointConfiguration.new(client: self, result: result)
      end
    end
  end
end
