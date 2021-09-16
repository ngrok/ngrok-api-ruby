require 'spec_helper'

RSpec.describe NgrokAPI::Models::ReservedDomain do
  let(:result) do
    {
      "id" => "rd_1xxLksFRG6o5MoAKX8UrtPnXbmz",
      "uri" => "https://api.ngrok.com/reserved_domains/rd_1xxLksFRG6o5MoAKX8UrtPnXbmz",
      "created_at" => "2021-09-10T16:38:58Z",
      "description" => "",
      "metadata" => "",
      "domain" => "tahouetnaoh.ngrok.io",
      "region" => "us",
      "cname_target" => nil,
      "http_endpoint_configuration" => {
        "id" => "ec_1xv9oZpu0g1sbaZvxuqKQJVCLW5",
        "uri" => "https://api.ngrok.com/endpoint_configurations/ec_1xv9oZpu0g1sbaZvxuqKQJVCLW5",
      },
      "https_endpoint_configuration" => nil,
      "certificate" => nil,
      "certificate_management_policy" => nil,
      "certificate_management_status" => nil,
    }
  end

  before(:each) do
    @client = class_double("ReservedDomainsClient")
    @domain = NgrokAPI::Models::ReservedDomain.new(client: @client, result: result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      domain2 = NgrokAPI::Models::ReservedDomain.new(client: @client, result: result)
      expect(@domain == domain2).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@domain.to_s).to eq result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@domain.client).to receive(:delete)
      @domain.delete
    end
  end

  describe "#update" do
    it "updates the instance's description and metadata and call update on the client" do
      # new_certificate_id = 'new certificate_id'
      # new_http_endpoint_configuration_id = 'new http_endpoint_configuration_id'
      # new_https_endpoint_configuration_id = 'new https_endpoint_configuration_id'
      new_certificate_management_policy = 'new certificate_management_policy'
      new_description = 'new description'
      new_metadata = 'new metadata'
      expect(@domain.client).to receive(:update)

      # certificate_id: new_certificate_id,
      # http_endpoint_configuration_id: new_http_endpoint_configuration_id,
      # https_endpoint_configuration_id: new_https_endpoint_configuration_id
      @domain.update(
        description: new_description,
        metadata: new_metadata,
        certificate_management_policy: new_certificate_management_policy
      )
      expect(@domain.description).to eq new_description
      expect(@domain.metadata).to eq new_metadata
      expect(@domain.certificate_management_policy).to eq new_certificate_management_policy
      # expect(@domain.certificate_id).to eq new_certificate_id
      # expect(@domain.http_endpoint_configuration_id).to eq new_http_endpoint_configuration_id
      # expect(@domain.https_endpoint_configuration_id).to eq new_https_endpoint_configuration_id
    end
  end

  describe "#delete_certificate" do
  end

  describe "#delete_certificate_management_policy" do
  end

  describe "#delete_http_endpoint_config" do
  end

  describe "#delete_https_endpoint_config" do
  end

  describe "#restore_certificate" do
  end

  describe "#restore_certificate_management_policy" do
  end

  describe "#restore_http_endpoint_config" do
  end

  describe "#restore_https_endpoint_config" do
  end
end
