require 'spec_helper'

RSpec.describe NgrokAPI::Services::IPRestrictionsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/ip_restrictions' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: ip_restriction_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @ip_restrictions_client = NgrokAPI::Services::IPRestrictionsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::IPRestriction" do
      path = '/ip_restrictions'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:enforced] = "New enforced"
      data[:type] = "New type"
      data[:ip_policy_ids] = "New ip_policy_ids"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(ip_restriction_result)
      result = @ip_restrictions_client.create(
        description: "New description",
        metadata: "New metadata",
        enforced: "New enforced",
        type: "New type",
        ip_policy_ids: "New ip_policy_ids"
      )
      expect(result.class).to eq(NgrokAPI::Models::IPRestriction)
    end
  end

  describe "#create!" do
    it "will make a post request and return an instance of NgrokAPI::Models::IPRestriction" do
      path = '/ip_restrictions'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:enforced] = "New enforced"
      data[:type] = "New type"
      data[:ip_policy_ids] = "New ip_policy_ids"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(ip_restriction_result)
      result = @ip_restrictions_client.create(
        description: "New description",
        metadata: "New metadata",
        enforced: "New enforced",
        type: "New type",
        ip_policy_ids: "New ip_policy_ids"
      )
      expect(result.class).to eq(NgrokAPI::Models::IPRestriction)
      # expect(result.id).to eq(ip_restriction_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/ip_restrictions/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @ip_restrictions_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/ip_restrictions/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @ip_restrictions_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/ip_restrictions/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @ip_restrictions_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::IPRestriction" do
      path = '/ip_restrictions/%{id}'
      replacements = {
        id: ip_restriction_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ip_restriction_result)
      result = @ip_restrictions_client.get(
        id: ip_restriction_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::IPRestriction)
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::IPRestriction" do
      path = '/ip_restrictions/%{id}'
      replacements = {
        id: ip_restriction_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ip_restriction_result)
      result = @ip_restrictions_client.get(
        id: ip_restriction_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::IPRestriction)
      # expect(result.id).to eq(ip_restriction_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(ip_restriction_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @ip_restrictions_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::IPRestriction" do
      path = '/ip_restrictions/%{id}'
      replacements = {
        id: ip_restriction_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:enforced] = "New enforced"
      data[:ip_policy_ids] = "New ip_policy_ids"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ip_restriction_result)
      result = @ip_restrictions_client.update(
        id: ip_restriction_result["id"],
        description: "New description",
        metadata: "New metadata",
        enforced: "New enforced",
        ip_policy_ids: "New ip_policy_ids"
      )
      expect(result.class).to eq(NgrokAPI::Models::IPRestriction)
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::IPRestriction" do
      path = '/ip_restrictions/%{id}'
      replacements = {
        id: ip_restriction_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:enforced] = "New enforced"
      data[:ip_policy_ids] = "New ip_policy_ids"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ip_restriction_result)
      result = @ip_restrictions_client.update(
        id: ip_restriction_result["id"],
        description: "New description",
        metadata: "New metadata",
        enforced: "New enforced",
        ip_policy_ids: "New ip_policy_ids"
      )
      expect(result.class).to eq(NgrokAPI::Models::IPRestriction)
      # expect(result.id).to eq(ip_restriction_result["id"])
    end
  end
end
