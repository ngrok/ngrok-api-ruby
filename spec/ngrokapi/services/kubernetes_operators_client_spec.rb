# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::KubernetesOperatorsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/kubernetes_operators' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: kubernetes_operator_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @kubernetes_operators_client = NgrokAPI::Services::KubernetesOperatorsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::KubernetesOperator" do
      path = '/kubernetes_operators'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:enabled_features] = "New enabled_features"
      data[:region] = "New region"
      data[:deployment] = "New deployment"
      data[:binding] = "New binding"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(kubernetes_operator_result)
      result = @kubernetes_operators_client.create(
        description: "New description",
        metadata: "New metadata",
        enabled_features: "New enabled_features",
        region: "New region",
        deployment: "New deployment",
        binding: "New binding"
      )
      expect(result.class).to eq(NgrokAPI::Models::KubernetesOperator)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::KubernetesOperator" do
      path = '/kubernetes_operators'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:enabled_features] = "New enabled_features"
      data[:region] = "New region"
      data[:deployment] = "New deployment"
      data[:binding] = "New binding"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(kubernetes_operator_result)
      result = @kubernetes_operators_client.create(
        description: "New description",
        metadata: "New metadata",
        enabled_features: "New enabled_features",
        region: "New region",
        deployment: "New deployment",
        binding: "New binding"
      )
      expect(result.class).to eq(NgrokAPI::Models::KubernetesOperator)
      # expect(result.id).to eq(kubernetes_operator_result["id"])
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::KubernetesOperator" do
      path = '/kubernetes_operators/%{id}'
      replacements = {
        id: kubernetes_operator_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:enabled_features] = "New enabled_features"
      data[:region] = "New region"
      data[:binding] = "New binding"
      data[:deployment] = "New deployment"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(kubernetes_operator_result)
      result = @kubernetes_operators_client.update(
        id: kubernetes_operator_result["id"],
        description: "New description",
        metadata: "New metadata",
        enabled_features: "New enabled_features",
        region: "New region",
        binding: "New binding",
        deployment: "New deployment"
      )
      expect(result.class).to eq(NgrokAPI::Models::KubernetesOperator)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::KubernetesOperator" do
      path = '/kubernetes_operators/%{id}'
      replacements = {
        id: kubernetes_operator_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:enabled_features] = "New enabled_features"
      data[:region] = "New region"
      data[:binding] = "New binding"
      data[:deployment] = "New deployment"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(kubernetes_operator_result)
      result = @kubernetes_operators_client.update(
        id: kubernetes_operator_result["id"],
        description: "New description",
        metadata: "New metadata",
        enabled_features: "New enabled_features",
        region: "New region",
        binding: "New binding",
        deployment: "New deployment"
      )
      expect(result.class).to eq(NgrokAPI::Models::KubernetesOperator)
      # expect(result.id).to eq(kubernetes_operator_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/kubernetes_operators/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @kubernetes_operators_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/kubernetes_operators/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @kubernetes_operators_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/kubernetes_operators/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @kubernetes_operators_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::KubernetesOperator" do
      path = '/kubernetes_operators/%{id}'
      replacements = {
        id: kubernetes_operator_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(kubernetes_operator_result)
      result = @kubernetes_operators_client.get(
        id: kubernetes_operator_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::KubernetesOperator)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::KubernetesOperator" do
      path = '/kubernetes_operators/%{id}'
      replacements = {
        id: kubernetes_operator_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(kubernetes_operator_result)
      result = @kubernetes_operators_client.get(
        id: kubernetes_operator_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::KubernetesOperator)
      # expect(result.id).to eq(kubernetes_operator_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(kubernetes_operator_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @kubernetes_operators_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#get_bound_endpoints" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      path = '/kubernetes_operators/%{id}/bound_endpoints'
      replacements = {
        id: kubernetes_operators_get_bound_endpoints_input["id"],
      }
      path = path % replacements
      expect(@client).to receive(:list).
        and_return(endpoint_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @kubernetes_operators_client.get_bound_endpoints(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end
end
