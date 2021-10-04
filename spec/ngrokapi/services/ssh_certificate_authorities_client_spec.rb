require 'spec_helper'

RSpec.describe NgrokAPI::Services::SSHCertificateAuthoritiesClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/ssh_certificate_authorities' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: ssh_certificate_authority_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @ssh_certificate_authorities_client = NgrokAPI::Services::SSHCertificateAuthoritiesClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::SSHCertificateAuthority" do
      path = '/ssh_certificate_authorities'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:private_key_type] = "New private_key_type"
      data[:elliptic_curve] = "New elliptic_curve"
      data[:key_size] = "New key_size"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(ssh_certificate_authority_result)
      result = @ssh_certificate_authorities_client.create(
        description: "New description",
        metadata: "New metadata",
        private_key_type: "New private_key_type",
        elliptic_curve: "New elliptic_curve",
        key_size: "New key_size"
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHCertificateAuthority)
      # expect(result.id).to eq(ssh_certificate_authority_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/ssh_certificate_authorities/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @ssh_certificate_authorities_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/ssh_certificate_authorities/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @ssh_certificate_authorities_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/ssh_certificate_authorities/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @ssh_certificate_authorities_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::SSHCertificateAuthority" do
      path = '/ssh_certificate_authorities/%{id}'
      replacements = {
        id: ssh_certificate_authority_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ssh_certificate_authority_result)
      result = @ssh_certificate_authorities_client.get(
        id: ssh_certificate_authority_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHCertificateAuthority)
      # expect(result.id).to eq(ssh_certificate_authority_result["id"])
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::SSHCertificateAuthority" do
      path = '/ssh_certificate_authorities/%{id}'
      replacements = {
        id: ssh_certificate_authority_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ssh_certificate_authority_result)
      result = @ssh_certificate_authorities_client.get(
        id: ssh_certificate_authority_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHCertificateAuthority)
      # expect(result.id).to eq(ssh_certificate_authority_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(ssh_certificate_authority_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @ssh_certificate_authorities_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::SSHCertificateAuthority" do
      path = '/ssh_certificate_authorities/%{id}'
      replacements = {
        id: ssh_certificate_authority_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ssh_certificate_authority_result)
      result = @ssh_certificate_authorities_client.update(
        id: ssh_certificate_authority_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHCertificateAuthority)
      # expect(result.id).to eq(ssh_certificate_authority_result["id"])
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::SSHCertificateAuthority" do
      path = '/ssh_certificate_authorities/%{id}'
      replacements = {
        id: ssh_certificate_authority_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ssh_certificate_authority_result)
      result = @ssh_certificate_authorities_client.update(
        id: ssh_certificate_authority_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHCertificateAuthority)
      # expect(result.id).to eq(ssh_certificate_authority_result["id"])
    end
  end
end
