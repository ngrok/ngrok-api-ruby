require 'spec_helper'

RSpec.describe NgrokAPI::Services::AgentIngressesClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/agent_ingresses' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: agent_ingress_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @agent_ingresses_client = NgrokAPI::Services::AgentIngressesClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::AgentIngress" do
      path = '/agent_ingresses'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:domain] = "New domain"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(agent_ingress_result)
      result = @agent_ingresses_client.create(
        description: "New description",
        metadata: "New metadata",
        domain: "New domain"
      )
      expect(result.class).to eq(NgrokAPI::Models::AgentIngress)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::AgentIngress" do
      path = '/agent_ingresses'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:domain] = "New domain"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(agent_ingress_result)
      result = @agent_ingresses_client.create(
        description: "New description",
        metadata: "New metadata",
        domain: "New domain"
      )
      expect(result.class).to eq(NgrokAPI::Models::AgentIngress)
      # expect(result.id).to eq(agent_ingress_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/agent_ingresses/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @agent_ingresses_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/agent_ingresses/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @agent_ingresses_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/agent_ingresses/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @agent_ingresses_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::AgentIngress" do
      path = '/agent_ingresses/%{id}'
      replacements = {
        id: agent_ingress_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(agent_ingress_result)
      result = @agent_ingresses_client.get(
        id: agent_ingress_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::AgentIngress)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::AgentIngress" do
      path = '/agent_ingresses/%{id}'
      replacements = {
        id: agent_ingress_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(agent_ingress_result)
      result = @agent_ingresses_client.get(
        id: agent_ingress_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::AgentIngress)
      # expect(result.id).to eq(agent_ingress_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(agent_ingress_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @agent_ingresses_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::AgentIngress" do
      path = '/agent_ingresses/%{id}'
      replacements = {
        id: agent_ingress_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(agent_ingress_result)
      result = @agent_ingresses_client.update(
        id: agent_ingress_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::AgentIngress)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::AgentIngress" do
      path = '/agent_ingresses/%{id}'
      replacements = {
        id: agent_ingress_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(agent_ingress_result)
      result = @agent_ingresses_client.update(
        id: agent_ingress_result["id"],
        description: "New description",
        metadata: "New metadata"
      )
      expect(result.class).to eq(NgrokAPI::Models::AgentIngress)
      # expect(result.id).to eq(agent_ingress_result["id"])
    end
  end
end
