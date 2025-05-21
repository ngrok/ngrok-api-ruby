# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Models::KubernetesOperatorCert do
  before(:each) do
    @client = class_double("KubernetesOperatorCertsClient")
    @kubernetes_operator_cert = NgrokAPI::Models::KubernetesOperatorCert.new(client: @client, attrs: kubernetes_operator_cert_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::KubernetesOperatorCert.new(client: @client, attrs: kubernetes_operator_cert_result)
      expect(@kubernetes_operator_cert == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@kubernetes_operator_cert.to_s).to eq kubernetes_operator_cert_result.to_s
    end
  end
end
