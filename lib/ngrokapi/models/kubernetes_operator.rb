# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

require 'uri'

module NgrokAPI
  module Models
    class KubernetesOperator
      attr_reader :client,
        :attrs,
        :id,
        :uri,
        :created_at,
        :updated_at,
        :description,
        :metadata,
        :principal,
        :enabled_features,
        :region,
        :deployment,
        :binding

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        unless @attrs['uri'].nil?
          @uri = URI(@attrs['uri'])
        end
        @created_at = @attrs['created_at']
        @updated_at = @attrs['updated_at']
        @description = @attrs['description']
        @metadata = @attrs['metadata']
        @principal = @attrs['principal']
        @enabled_features = @attrs['enabled_features']
        @region = @attrs['region']
        @deployment = @attrs['deployment']
        @binding = @attrs['binding']
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
      # Update an existing Kubernetes operator by ID.
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-update
      def update(
        description: nil,
        metadata: nil,
        enabled_features: nil,
        region: nil,
        binding: nil,
        deployment: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @enabled_features = enabled_features if enabled_features
        @region = region if region
        @binding = binding if binding
        @deployment = deployment if deployment
        @client.update(
          id: @id,
          description: description,
          metadata: metadata,
          enabled_features: enabled_features,
          region: region,
          binding: binding,
          deployment: deployment
        )
      end

      ##
      # Delete a Kubernetes Operator
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-delete
      def delete
        @client.delete(
          id: @id
        )
      end
    end
  end
end
