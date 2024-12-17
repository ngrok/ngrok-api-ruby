# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::KubernetesOperator do
  before(:each) do
    @client = class_double("KubernetesOperatorsClient")
    @kubernetes_operator = NgrokAPI::Models::KubernetesOperator.new(client: @client, attrs: kubernetes_operator_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::KubernetesOperator.new(client: @client, attrs: kubernetes_operator_result)
      expect(@kubernetes_operator == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@kubernetes_operator.to_s).to eq kubernetes_operator_result.to_s
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      new_enabled_features = 'New enabled_features'
      new_region = 'New region'
      new_binding = 'New binding'
      new_deployment = 'New deployment'
      expect(@kubernetes_operator.client).to receive(:update)
      @kubernetes_operator.update(
        description: new_description,
        metadata: new_metadata,
        enabled_features: new_enabled_features,
        region: new_region,
        binding: new_binding,
        deployment: new_deployment
      )
      expect(@kubernetes_operator.description).to eq new_description
      expect(@kubernetes_operator.metadata).to eq new_metadata
      expect(@kubernetes_operator.enabled_features).to eq new_enabled_features
      expect(@kubernetes_operator.region).to eq new_region
      expect(@kubernetes_operator.binding).to eq new_binding
      expect(@kubernetes_operator.deployment).to eq new_deployment
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@kubernetes_operator.client).to receive(:delete)
      @kubernetes_operator.delete
    end
  end
end
