# Code generated for API Clients. DO NOT EDIT.

require 'spec_helper'

RSpec.describe NgrokAPI::Services::TLSCertificatesClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/tls_certificates' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: tls_certificate_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @tls_certificates_client = NgrokAPI::Services::TLSCertificatesClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::TLSCertificate" do
      path = '/tls_certificates'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:certificate_pem] = "New certificate_pem"
      data[:private_key_pem] = "New private_key_pem"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(tls_certificate_result)
      result = @tls_certificates_client.create(
        description: "New description",
        metadata: "New metadata",
        certificate_pem: "New certificate_pem",
        private_key_pem: "New private_key_pem"
      )
      expect(result.class).to eq(NgrokAPI::Models::TLSCertificate)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::TLSCertificate" do
      path = '/tls_certificates'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:certificate_pem] = "New certificate_pem"
      data[:private_key_pem] = "New private_key_pem"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(tls_certificate_result)
      result = @tls_certificates_client.create(
        description: "New description",
        metadata: "New metadata",
        certificate_pem: "New certificate_pem",
        private_key_pem: "New private_key_pem"
      )
      expect(result.class).to eq(NgrokAPI::Models::TLSCertificate)
      # expect(result.id).to eq(tls_certificate_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/tls_certificates/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @tls_certificates_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/tls_certificates/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @tls_certificates_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/tls_certificates/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @tls_certificates_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::TLSCertificate" do
      path = '/tls_certificates/%{id}'
      replacements = {
        id: tls_certificate_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(tls_certificate_result)
      result = @tls_certificates_client.get(
        id: tls_certificate_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::TLSCertificate)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::TLSCertificate" do
      path = '/tls_certificates/%{id}'
      replacements = {
        id: tls_certificate_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(tls_certificate_result)
      result = @tls_certificates_client.get(
        id: tls_certificate_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::TLSCertificate)
      # expect(result.id).to eq(tls_certificate_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(tls_certificate_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @tls_certificates_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::TLSCertificate" do
      path = '/tls_certificates/%{id}'
      replacements = {
        id: tls_certificate_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(tls_certificate_result)
      result = @tls_certificates_client.update(
        id: tls_certificate_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::TLSCertificate)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::TLSCertificate" do
      path = '/tls_certificates/%{id}'
      replacements = {
        id: tls_certificate_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(tls_certificate_result)
      result = @tls_certificates_client.update(
        id: tls_certificate_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::TLSCertificate)
      # expect(result.id).to eq(tls_certificate_result["id"])
    end
  end
end
