# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::KubernetesOperatorDeployment do
  before(:each) do
    @client = class_double("KubernetesOperatorDeploymentsClient")
    @kubernetes_operator_deployment = NgrokAPI::Models::KubernetesOperatorDeployment.new(client: @client, attrs: kubernetes_operator_deployment_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::KubernetesOperatorDeployment.new(client: @client, attrs: kubernetes_operator_deployment_result)
      expect(@kubernetes_operator_deployment == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@kubernetes_operator_deployment.to_s).to eq kubernetes_operator_deployment_result.to_s
    end
  end
end
