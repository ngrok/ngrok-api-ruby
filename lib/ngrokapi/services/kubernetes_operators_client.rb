# frozen_string_literal: true

# Code generated for API Clients. DO NOT EDIT.

module NgrokAPI
  module Services
    ##
    # KubernetesOperators is used by the Kubernetes Operator to register and
    #  manage its own resource, as well as for users to see active kubernetes
    #  clusters.
    #
    # https://ngrok.com/docs/api#api-kubernetes-operators
    class KubernetesOperatorsClient
      # The API path for the requests
      PATH = '/kubernetes_operators'
      # The List Property from the resulting API for list calls
      LIST_PROPERTY = 'operators'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # Create a new Kubernetes Operator
      #
      # @param [string] description human-readable description of this Kubernetes Operator. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Kubernetes Operator. optional, max 4096 bytes.
      # @param [List<string>] enabled_features features enabled for this Kubernetes Operator. a subset of {"bindings", "ingress", and "gateway"}
      # @param [string] region the ngrok region in which the ingress for this operator is served. defaults to "global"
      # @param [KubernetesOperatorDeployment] deployment information about the deployment of this Kubernetes Operator
      # @param [KubernetesOperatorBindingCreate] binding configuration for the Bindings feature of this Kubernetes Operator. set only if enabling the "bindings" feature
      # @return [NgrokAPI::Models::KubernetesOperator] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-create
      def create(description: "", metadata: "", enabled_features: [], region: "", deployment: nil, binding: nil)
        path = '/kubernetes_operators'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:enabled_features] = enabled_features if enabled_features
        data[:region] = region if region
        data[:deployment] = deployment if deployment
        data[:binding] = binding if binding
        result = @client.post(path % replacements, data: data)
        NgrokAPI::Models::KubernetesOperator.new(client: self, attrs: result)
      end

      ##
      # Create a new Kubernetes Operator
      # Throws an exception if API error.
      #
      # @param [string] description human-readable description of this Kubernetes Operator. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Kubernetes Operator. optional, max 4096 bytes.
      # @param [List<string>] enabled_features features enabled for this Kubernetes Operator. a subset of {"bindings", "ingress", and "gateway"}
      # @param [string] region the ngrok region in which the ingress for this operator is served. defaults to "global"
      # @param [KubernetesOperatorDeployment] deployment information about the deployment of this Kubernetes Operator
      # @param [KubernetesOperatorBindingCreate] binding configuration for the Bindings feature of this Kubernetes Operator. set only if enabling the "bindings" feature
      # @return [NgrokAPI::Models::KubernetesOperator] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-create
      def create!(description: "", metadata: "", enabled_features: [], region: "", deployment: nil, binding: nil)
        path = '/kubernetes_operators'
        replacements = {
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:enabled_features] = enabled_features if enabled_features
        data[:region] = region if region
        data[:deployment] = deployment if deployment
        data[:binding] = binding if binding
        result = @client.post(path % replacements, data: data, danger: true)
        NgrokAPI::Models::KubernetesOperator.new(client: self, attrs: result)
      end

      ##
      # Update an existing Kubernetes operator by ID.
      #
      # @param [string] id unique identifier for this Kubernetes Operator
      # @param [string] description human-readable description of this Kubernetes Operator. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Kubernetes Operator. optional, max 4096 bytes.
      # @param [List<string>] enabled_features features enabled for this Kubernetes Operator. a subset of {"bindings", "ingress", and "gateway"}
      # @param [string] region the ngrok region in which the ingress for this operator is served. defaults to "global"
      # @param [KubernetesOperatorBindingUpdate] binding configuration for the Bindings feature of this Kubernetes Operator. set only if enabling the "bindings" feature
      # @param [KubernetesOperatorDeploymentUpdate] deployment configuration for the Deployment info
      # @return [NgrokAPI::Models::KubernetesOperator] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-update
      def update(id: "", description: nil, metadata: nil, enabled_features: nil, region: nil, binding: nil, deployment: nil)
        path = '/kubernetes_operators/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:enabled_features] = enabled_features if enabled_features
        data[:region] = region if region
        data[:binding] = binding if binding
        data[:deployment] = deployment if deployment
        result = @client.patch(path % replacements, data: data)
        NgrokAPI::Models::KubernetesOperator.new(client: self, attrs: result)
      end

      ##
      # Update an existing Kubernetes operator by ID.
      # Throws an exception if API error.
      #
      # @param [string] id unique identifier for this Kubernetes Operator
      # @param [string] description human-readable description of this Kubernetes Operator. optional, max 255 bytes.
      # @param [string] metadata arbitrary user-defined machine-readable data of this Kubernetes Operator. optional, max 4096 bytes.
      # @param [List<string>] enabled_features features enabled for this Kubernetes Operator. a subset of {"bindings", "ingress", and "gateway"}
      # @param [string] region the ngrok region in which the ingress for this operator is served. defaults to "global"
      # @param [KubernetesOperatorBindingUpdate] binding configuration for the Bindings feature of this Kubernetes Operator. set only if enabling the "bindings" feature
      # @param [KubernetesOperatorDeploymentUpdate] deployment configuration for the Deployment info
      # @return [NgrokAPI::Models::KubernetesOperator] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-update
      def update!(id: "", description: nil, metadata: nil, enabled_features: nil, region: nil, binding: nil, deployment: nil)
        path = '/kubernetes_operators/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        data[:description] = description if description
        data[:metadata] = metadata if metadata
        data[:enabled_features] = enabled_features if enabled_features
        data[:region] = region if region
        data[:binding] = binding if binding
        data[:deployment] = deployment if deployment
        result = @client.patch(path % replacements, data: data, danger: true)
        NgrokAPI::Models::KubernetesOperator.new(client: self, attrs: result)
      end

      ##
      # Delete a Kubernetes Operator
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-delete
      def delete(id: "")
        path = '/kubernetes_operators/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # Delete a Kubernetes Operator
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-delete
      def delete!(id: "")
        path = '/kubernetes_operators/%{id}'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end

      ##
      # Get of a Kubernetes Operator
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::KubernetesOperator] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-get
      def get(id: "")
        path = '/kubernetes_operators/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::KubernetesOperator.new(client: self, attrs: result)
      end

      ##
      # Get of a Kubernetes Operator
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::KubernetesOperator] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-get
      def get!(id: "")
        path = '/kubernetes_operators/%{id}'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::KubernetesOperator.new(client: self, attrs: result)
      end

      ##
      # List all Kubernetes Operators owned by this account
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-list
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
          klass: NgrokAPI::Models::KubernetesOperator
        )
      end

      ##
      # List all Kubernetes Operators owned by this account
      # Throws an exception if API error.
      #
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-list
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
          klass: NgrokAPI::Models::KubernetesOperator,
          danger: true
        )
      end

      ##
      # List Endpoints bound to a Kubernetes Operator
      #
      # @param [string] id a resource identifier
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-get-bound-endpoints
      def get_bound_endpoints(id: "", before_id: nil, limit: nil, url: nil)
        path = '/kubernetes_operators/%{id}/bound_endpoints'
        replacements = {
          id: id,
        }
        result = @client.list(
          id: id,
          before_id: before_id,
          limit: limit,
          url: url,
          path: path % replacements
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: 'endpoints',
          klass: NgrokAPI::Models::Endpoint
        )
      end

      ##
      # List Endpoints bound to a Kubernetes Operator
      # Throws an exception if API error.
      #
      # @param [string] id a resource identifier
      # @param [string] before_id
      # @param [string] limit
      # @param [string] url optional and mutually exclusive from before_id and limit
      # @return [NgrokAPI::Models::Listable] result from the API request
      #
      # https://ngrok.com/docs/api#api-kubernetes-operators-get-bound-endpoints
      def get_bound_endpoints!(id: "", before_id: nil, limit: nil, url: nil)
        path = '/kubernetes_operators/%{id}/bound_endpoints'
        replacements = {
          id: id,
        }
        result = @client.list(
          id: id,
          before_id: before_id,
          limit: limit,
          danger: true,
          url: url,
          path: path % replacements
        )

        NgrokAPI::Models::Listable.new(
          client: self,
          attrs: result,
          list_property: 'endpoints',
          klass: NgrokAPI::Models::Endpoint,
          danger: true
        )
      end
    end
  end
end
