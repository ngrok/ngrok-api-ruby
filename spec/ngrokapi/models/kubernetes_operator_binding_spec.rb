# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::KubernetesOperatorBinding do
  before(:each) do
    @client = class_double("KubernetesOperatorBindingsClient")
    @kubernetes_operator_binding = NgrokAPI::Models::KubernetesOperatorBinding.new(client: @client, attrs: kubernetes_operator_binding_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::KubernetesOperatorBinding.new(client: @client, attrs: kubernetes_operator_binding_result)
      expect(@kubernetes_operator_binding == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@kubernetes_operator_binding.to_s).to eq kubernetes_operator_binding_result.to_s
    end
  end
end
