# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::ReservedDomainsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/reserved_domains' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: reserved_domain_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @reserved_domains_client = NgrokAPI::Services::ReservedDomainsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::ReservedDomain" do
      path = '/reserved_domains'
      replacements = {
      }
      data = {}
      data[:domain] = "New domain"
      data[:region] = "New region"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:certificate_id] = "New certificate_id"
      data[:certificate_management_policy] = "New certificate_management_policy"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(reserved_domain_result)
      result = @reserved_domains_client.create(
        name: "New name",
        domain: "New domain",
        region: "New region",
        description: "New description",
        metadata: "New metadata",
        http_endpoint_configuration_id: "New http_endpoint_configuration_id",
        https_endpoint_configuration_id: "New https_endpoint_configuration_id",
        certificate_id: "New certificate_id",
        certificate_management_policy: "New certificate_management_policy"
      )
      expect(result.class).to eq(NgrokAPI::Models::ReservedDomain)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::ReservedDomain" do
      path = '/reserved_domains'
      replacements = {
      }
      data = {}
      data[:domain] = "New domain"
      data[:region] = "New region"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:certificate_id] = "New certificate_id"
      data[:certificate_management_policy] = "New certificate_management_policy"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(reserved_domain_result)
      result = @reserved_domains_client.create(
        name: "New name",
        domain: "New domain",
        region: "New region",
        description: "New description",
        metadata: "New metadata",
        http_endpoint_configuration_id: "New http_endpoint_configuration_id",
        https_endpoint_configuration_id: "New https_endpoint_configuration_id",
        certificate_id: "New certificate_id",
        certificate_management_policy: "New certificate_management_policy"
      )
      expect(result.class).to eq(NgrokAPI::Models::ReservedDomain)
      # expect(result.id).to eq(reserved_domain_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/reserved_domains/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @reserved_domains_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/reserved_domains/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @reserved_domains_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/reserved_domains/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @reserved_domains_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::ReservedDomain" do
      path = '/reserved_domains/%{id}'
      replacements = {
        id: reserved_domain_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(reserved_domain_result)
      result = @reserved_domains_client.get(
        id: reserved_domain_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::ReservedDomain)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::ReservedDomain" do
      path = '/reserved_domains/%{id}'
      replacements = {
        id: reserved_domain_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(reserved_domain_result)
      result = @reserved_domains_client.get(
        id: reserved_domain_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::ReservedDomain)
      # expect(result.id).to eq(reserved_domain_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(reserved_domain_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @reserved_domains_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::ReservedDomain" do
      path = '/reserved_domains/%{id}'
      replacements = {
        id: reserved_domain_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:certificate_id] = "New certificate_id"
      data[:certificate_management_policy] = "New certificate_management_policy"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(reserved_domain_result)
      result = @reserved_domains_client.update(
        id: reserved_domain_result["id"],
        description: "New description",
        metadata: "New metadata",
        http_endpoint_configuration_id: "New http_endpoint_configuration_id",
        https_endpoint_configuration_id: "New https_endpoint_configuration_id",
        certificate_id: "New certificate_id",
        certificate_management_policy: "New certificate_management_policy",
        region: "New region"
      )
      expect(result.class).to eq(NgrokAPI::Models::ReservedDomain)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::ReservedDomain" do
      path = '/reserved_domains/%{id}'
      replacements = {
        id: reserved_domain_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:certificate_id] = "New certificate_id"
      data[:certificate_management_policy] = "New certificate_management_policy"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(reserved_domain_result)
      result = @reserved_domains_client.update(
        id: reserved_domain_result["id"],
        description: "New description",
        metadata: "New metadata",
        http_endpoint_configuration_id: "New http_endpoint_configuration_id",
        https_endpoint_configuration_id: "New https_endpoint_configuration_id",
        certificate_id: "New certificate_id",
        certificate_management_policy: "New certificate_management_policy",
        region: "New region"
      )
      expect(result.class).to eq(NgrokAPI::Models::ReservedDomain)
      # expect(result.id).to eq(reserved_domain_result["id"])
    end
  end

  describe "#delete_certificate_management_policy" do
    it "will make a delete request" do
      path = '/reserved_domains/%{id}/certificate_management_policy'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @reserved_domains_client.delete_certificate_management_policy(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete_certificate_management_policy!" do
    it "will make a delete request" do
      path = '/reserved_domains/%{id}/certificate_management_policy'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @reserved_domains_client.delete_certificate_management_policy!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/reserved_domains/%{id}/certificate_management_policy'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @reserved_domains_client.delete_certificate_management_policy!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#delete_certificate" do
    it "will make a delete request" do
      path = '/reserved_domains/%{id}/certificate'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @reserved_domains_client.delete_certificate(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete_certificate!" do
    it "will make a delete request" do
      path = '/reserved_domains/%{id}/certificate'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @reserved_domains_client.delete_certificate!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/reserved_domains/%{id}/certificate'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @reserved_domains_client.delete_certificate!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
