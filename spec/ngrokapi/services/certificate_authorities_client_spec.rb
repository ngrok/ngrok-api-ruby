require 'spec_helper'

RSpec.describe NgrokAPI::Services::CertificateAuthoritiesClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/certificate_authorities' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: certificate_authority_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @certificate_authorities_client = NgrokAPI::Services::CertificateAuthoritiesClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::CertificateAuthority" do
      path = '/certificate_authorities'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:ca_pem] = "New ca_pem"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(certificate_authority_result)
      result = @certificate_authorities_client.create(
        description: "New description",
        metadata: "New metadata",
        ca_pem: "New ca_pem"
      )
      expect(result.class).to eq(NgrokAPI::Models::CertificateAuthority)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::CertificateAuthority" do
      path = '/certificate_authorities'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:ca_pem] = "New ca_pem"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(certificate_authority_result)
      result = @certificate_authorities_client.create(
        description: "New description",
        metadata: "New metadata",
        ca_pem: "New ca_pem"
      )
      expect(result.class).to eq(NgrokAPI::Models::CertificateAuthority)
      # expect(result.id).to eq(certificate_authority_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/certificate_authorities/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @certificate_authorities_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/certificate_authorities/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @certificate_authorities_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/certificate_authorities/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @certificate_authorities_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::CertificateAuthority" do
      path = '/certificate_authorities/%{id}'
      replacements = {
        id: certificate_authority_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(certificate_authority_result)
      result = @certificate_authorities_client.get(
        id: certificate_authority_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::CertificateAuthority)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::CertificateAuthority" do
      path = '/certificate_authorities/%{id}'
      replacements = {
        id: certificate_authority_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(certificate_authority_result)
      result = @certificate_authorities_client.get(
        id: certificate_authority_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::CertificateAuthority)
      # expect(result.id).to eq(certificate_authority_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(certificate_authority_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @certificate_authorities_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::CertificateAuthority" do
      path = '/certificate_authorities/%{id}'
      replacements = {
        id: certificate_authority_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(certificate_authority_result)
      result = @certificate_authorities_client.update(
        id: certificate_authority_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::CertificateAuthority)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::CertificateAuthority" do
      path = '/certificate_authorities/%{id}'
      replacements = {
        id: certificate_authority_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(certificate_authority_result)
      result = @certificate_authorities_client.update(
        id: certificate_authority_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::CertificateAuthority)
      # expect(result.id).to eq(certificate_authority_result["id"])
    end
  end
end
