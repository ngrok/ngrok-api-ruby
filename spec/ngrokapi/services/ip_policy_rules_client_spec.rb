require 'spec_helper'

RSpec.describe NgrokAPI::Services::IPPolicyRulesClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/ip_policy_rules' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: ip_policy_rule_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @ip_policy_rules_client = NgrokAPI::Services::IPPolicyRulesClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::IPPolicyRule" do
      path = '/ip_policy_rules'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:cidr] = "New cidr"
      data[:ip_policy_id] = "New ip_policy_id"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(ip_policy_rule_result)
      result = @ip_policy_rules_client.create(
        description: "New description",
        metadata: "New metadata",
        cidr: "New cidr",
        ip_policy_id: "New ip_policy_id"
      )
      expect(result.class).to eq(NgrokAPI::Models::IPPolicyRule)
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/ip_policy_rules/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @ip_policy_rules_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/ip_policy_rules/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @ip_policy_rules_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/ip_policy_rules/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @ip_policy_rules_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::IPPolicyRule" do
      path = '/ip_policy_rules/%{id}'
      replacements = {
        id: ip_policy_rule_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ip_policy_rule_result)
      result = @ip_policy_rules_client.get(
        id: ip_policy_rule_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::IPPolicyRule)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::IPPolicyRule" do
      path = '/ip_policy_rules/%{id}'
      replacements = {
        id: ip_policy_rule_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ip_policy_rule_result)
      result = @ip_policy_rules_client.get(
        id: ip_policy_rule_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::IPPolicyRule)
      # expect(result.id).to eq(ip_policy_rule_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(ip_policy_rule_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @ip_policy_rules_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::IPPolicyRule" do
      path = '/ip_policy_rules/%{id}'
      replacements = {
        id: ip_policy_rule_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:cidr] = "New cidr"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ip_policy_rule_result)
      result = @ip_policy_rules_client.update(
        id: ip_policy_rule_result["id"],
        description: "New description",
        metadata: "New metadata",
        cidr: "New cidr"
      )
      expect(result.class).to eq(NgrokAPI::Models::IPPolicyRule)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::IPPolicyRule" do
      path = '/ip_policy_rules/%{id}'
      replacements = {
        id: ip_policy_rule_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:cidr] = "New cidr"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ip_policy_rule_result)
      result = @ip_policy_rules_client.update(
        id: ip_policy_rule_result["id"],
        description: "New description",
        metadata: "New metadata",
        cidr: "New cidr"
      )
      expect(result.class).to eq(NgrokAPI::Models::IPPolicyRule)
      # expect(result.id).to eq(ip_policy_rule_result["id"])
    end
  end
end
