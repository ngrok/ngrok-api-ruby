# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::KubernetesOperatorBindingUpdate do
  before(:each) do
    @client = class_double("KubernetesOperatorBindingUpdatesClient")
    @kubernetes_operator_binding_update = NgrokAPI::Models::KubernetesOperatorBindingUpdate.new(client: @client, attrs: kubernetes_operator_binding_update_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::KubernetesOperatorBindingUpdate.new(client: @client, attrs: kubernetes_operator_binding_update_result)
      expect(@kubernetes_operator_binding_update == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@kubernetes_operator_binding_update.to_s).to eq kubernetes_operator_binding_update_result.to_s
    end
  end
end
