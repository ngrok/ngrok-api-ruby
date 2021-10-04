require 'spec_helper'

RSpec.describe NgrokAPI::Services::SSHUserCertificatesClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/ssh_user_certificates' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: ssh_user_certificate_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @ssh_user_certificates_client = NgrokAPI::Services::SSHUserCertificatesClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::SSHUserCertificate" do
      path = '/ssh_user_certificates'
      replacements = {
      }
      data = {}
      data[:ssh_certificate_authority_id] = "New ssh_certificate_authority_id"
      data[:public_key] = "New public_key"
      data[:principals] = "New principals"
      data[:critical_options] = "New critical_options"
      data[:extensions] = "New extensions"
      data[:valid_after] = "New valid_after"
      data[:valid_until] = "New valid_until"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(ssh_user_certificate_result)
      result = @ssh_user_certificates_client.create(
        ssh_certificate_authority_id: "New ssh_certificate_authority_id",
        public_key: "New public_key",
        principals: "New principals",
        critical_options: "New critical_options",
        extensions: "New extensions",
        valid_after: "New valid_after",
        valid_until: "New valid_until",
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHUserCertificate)
      # expect(result.id).to eq(ssh_user_certificate_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/ssh_user_certificates/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @ssh_user_certificates_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/ssh_user_certificates/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @ssh_user_certificates_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/ssh_user_certificates/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @ssh_user_certificates_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::SSHUserCertificate" do
      path = '/ssh_user_certificates/%{id}'
      replacements = {
        id: ssh_user_certificate_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ssh_user_certificate_result)
      result = @ssh_user_certificates_client.get(
        id: ssh_user_certificate_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHUserCertificate)
      # expect(result.id).to eq(ssh_user_certificate_result["id"])
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::SSHUserCertificate" do
      path = '/ssh_user_certificates/%{id}'
      replacements = {
        id: ssh_user_certificate_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ssh_user_certificate_result)
      result = @ssh_user_certificates_client.get(
        id: ssh_user_certificate_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHUserCertificate)
      # expect(result.id).to eq(ssh_user_certificate_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(ssh_user_certificate_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @ssh_user_certificates_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::SSHUserCertificate" do
      path = '/ssh_user_certificates/%{id}'
      replacements = {
        id: ssh_user_certificate_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ssh_user_certificate_result)
      result = @ssh_user_certificates_client.update(
        id: ssh_user_certificate_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHUserCertificate)
      # expect(result.id).to eq(ssh_user_certificate_result["id"])
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::SSHUserCertificate" do
      path = '/ssh_user_certificates/%{id}'
      replacements = {
        id: ssh_user_certificate_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ssh_user_certificate_result)
      result = @ssh_user_certificates_client.update(
        id: ssh_user_certificate_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHUserCertificate)
      # expect(result.id).to eq(ssh_user_certificate_result["id"])
    end
  end
end
