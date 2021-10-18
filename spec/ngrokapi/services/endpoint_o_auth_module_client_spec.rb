require 'spec_helper'

RSpec.describe NgrokAPI::Services::EndpointOAuthModuleClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/endpoint_configurations/%{id}/oauth' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: endpoint_o_auth_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @endpoint_o_auth_module_client = NgrokAPI::Services::EndpointOAuthModuleClient.new(client: @client)
  end

  describe "#replace" do
    it "will make a put request and return an instance of NgrokAPI::Models::EndpointOAuth" do
      path = '/endpoint_configurations/%{id}/oauth'
      replacements = {
        id: endpoint_o_auth_result["id"],
      }
      data = {}
      data[:module] = "New a_module"
      expect(@client).to receive(:put).with(path % replacements, data: data).
        and_return(endpoint_o_auth_result)
      result = @endpoint_o_auth_module_client.replace(
        id: endpoint_o_auth_result["id"],
        a_module: "New a_module"
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointOAuth)
    end
  end

  describe "#replace!" do
    it "will make a put request and return an instance of NgrokAPI::Models::EndpointOAuth" do
      path = '/endpoint_configurations/%{id}/oauth'
      replacements = {
        id: endpoint_o_auth_result["id"],
      }
      data = {}
      data[:module] = "New a_module"
      expect(@client).to receive(:put).with(path % replacements, data: data).
        and_return(endpoint_o_auth_result)
      result = @endpoint_o_auth_module_client.replace(
        id: endpoint_o_auth_result["id"],
        a_module: "New a_module"
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointOAuth)
      # expect(result.id).to eq(endpoint_o_auth_result["id"])
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::EndpointOAuth" do
      path = '/endpoint_configurations/%{id}/oauth'
      replacements = {
        id: endpoint_o_auth_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_o_auth_result)
      result = @endpoint_o_auth_module_client.get(
        id: endpoint_o_auth_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointOAuth)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::EndpointOAuth" do
      path = '/endpoint_configurations/%{id}/oauth'
      replacements = {
        id: endpoint_o_auth_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(endpoint_o_auth_result)
      result = @endpoint_o_auth_module_client.get(
        id: endpoint_o_auth_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::EndpointOAuth)
      # expect(result.id).to eq(endpoint_o_auth_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/endpoint_configurations/%{id}/oauth'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @endpoint_o_auth_module_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/endpoint_configurations/%{id}/oauth'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @endpoint_o_auth_module_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/endpoint_configurations/%{id}/oauth'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @endpoint_o_auth_module_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end
end
