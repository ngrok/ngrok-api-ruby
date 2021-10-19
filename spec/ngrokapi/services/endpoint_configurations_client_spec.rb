require 'spec_helper'

RSpec.describe NgrokAPI::Services::EndpointConfigurationsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/endpoint_configurations' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: endpoint_configuration_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @endpoint_configurations_client = NgrokAPI::Services::EndpointConfigurationsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::EndpointConfiguration" do
      path = '/endpoint_configurations'
      replacements = {
      }
      data = {}
      data[:type] = "New type"
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:circuit_breaker] = "New circuit_breaker"
      data[:compression] = "New compression"
      data[:request_headers] = "New request_headers"
      data[:response_headers] = "New response_headers"
      data[:ip_policy] = "New ip_policy"
      data[:mutual_tls] = "New mutual_tls"
      data[:tls_termination] = "New tls_termination"
      data[:webhook_validation] = "New webhook_validation"
      data[:oauth] = "New oauth"
      data[:logging] = "New logging"
      data[:saml] = "New saml"
      data[:oidc] = "New oidc"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(endpoint_configuration_result)
      result = @endpoint_configurations_client.create(
        type: "New type",
        description: "New description",
        metadata: "New metadata",
        basic_auth: "New basic_auth",
        circuit_breaker: "New circuit_breaker",
        compression: "New compression",
        request_headers: "New request_headers",
        response_headers: "New response_headers",
        ip_policy: "New ip_policy",
        mutual_tls: "New mutual_tls",
        tls_termination: "New tls_termination",
        webhook_validation: "New webhook_validation",
        oauth: "New oauth",
        logging: "New logging",
        saml: "New saml",
        oidc: "New oidc",
        backend: "New backend"
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointConfiguration)
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/endpoint_configurations/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @endpoint_configurations_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/endpoint_configurations/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @endpoint_configurations_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/endpoint_configurations/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @endpoint_configurations_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::EndpointConfiguration" do
      path = '/endpoint_configurations/%{id}'
      replacements = {
        id: endpoint_configuration_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_configuration_result)
      result = @endpoint_configurations_client.get(
        id: endpoint_configuration_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointConfiguration)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::EndpointConfiguration" do
      path = '/endpoint_configurations/%{id}'
      replacements = {
        id: endpoint_configuration_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_configuration_result)
      result = @endpoint_configurations_client.get(
        id: endpoint_configuration_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointConfiguration)
      # expect(result.id).to eq(endpoint_configuration_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(endpoint_configuration_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @endpoint_configurations_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::EndpointConfiguration" do
      path = '/endpoint_configurations/%{id}'
      replacements = {
        id: endpoint_configuration_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:circuit_breaker] = "New circuit_breaker"
      data[:compression] = "New compression"
      data[:request_headers] = "New request_headers"
      data[:response_headers] = "New response_headers"
      data[:ip_policy] = "New ip_policy"
      data[:mutual_tls] = "New mutual_tls"
      data[:tls_termination] = "New tls_termination"
      data[:webhook_validation] = "New webhook_validation"
      data[:oauth] = "New oauth"
      data[:logging] = "New logging"
      data[:saml] = "New saml"
      data[:oidc] = "New oidc"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(endpoint_configuration_result)
      result = @endpoint_configurations_client.update(
        id: endpoint_configuration_result["id"],
        description: "New description",
        metadata: "New metadata",
        basic_auth: "New basic_auth",
        circuit_breaker: "New circuit_breaker",
        compression: "New compression",
        request_headers: "New request_headers",
        response_headers: "New response_headers",
        ip_policy: "New ip_policy",
        mutual_tls: "New mutual_tls",
        tls_termination: "New tls_termination",
        webhook_validation: "New webhook_validation",
        oauth: "New oauth",
        logging: "New logging",
        saml: "New saml",
        oidc: "New oidc",
        backend: "New backend"
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointConfiguration)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::EndpointConfiguration" do
      path = '/endpoint_configurations/%{id}'
      replacements = {
        id: endpoint_configuration_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:circuit_breaker] = "New circuit_breaker"
      data[:compression] = "New compression"
      data[:request_headers] = "New request_headers"
      data[:response_headers] = "New response_headers"
      data[:ip_policy] = "New ip_policy"
      data[:mutual_tls] = "New mutual_tls"
      data[:tls_termination] = "New tls_termination"
      data[:webhook_validation] = "New webhook_validation"
      data[:oauth] = "New oauth"
      data[:logging] = "New logging"
      data[:saml] = "New saml"
      data[:oidc] = "New oidc"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(endpoint_configuration_result)
      result = @endpoint_configurations_client.update(
        id: endpoint_configuration_result["id"],
        description: "New description",
        metadata: "New metadata",
        basic_auth: "New basic_auth",
        circuit_breaker: "New circuit_breaker",
        compression: "New compression",
        request_headers: "New request_headers",
        response_headers: "New response_headers",
        ip_policy: "New ip_policy",
        mutual_tls: "New mutual_tls",
        tls_termination: "New tls_termination",
        webhook_validation: "New webhook_validation",
        oauth: "New oauth",
        logging: "New logging",
        saml: "New saml",
        oidc: "New oidc",
        backend: "New backend"
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointConfiguration)
      # expect(result.id).to eq(endpoint_configuration_result["id"])
    end
  end
end
