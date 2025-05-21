# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::KubernetesOperatorBindingCreate do
  before(:each) do
    @client = class_double("KubernetesOperatorBindingCreatesClient")
    @kubernetes_operator_binding_create = NgrokAPI::Models::KubernetesOperatorBindingCreate.new(client: @client, attrs: kubernetes_operator_binding_create_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::KubernetesOperatorBindingCreate.new(client: @client, attrs: kubernetes_operator_binding_create_result)
      expect(@kubernetes_operator_binding_create == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@kubernetes_operator_binding_create.to_s).to eq kubernetes_operator_binding_create_result.to_s
    end
  end
end
