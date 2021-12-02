require 'spec_helper'

RSpec.describe NgrokAPI::Models::AgentIngress do
  before(:each) do
    @client = class_double("AgentIngresssClient")
    @agent_ingress = NgrokAPI::Models::AgentIngress.new(client: @client, result: agent_ingress_result)
  end

  describe "#==" do
    it "is equal if the results are the same" do
      other = NgrokAPI::Models::AgentIngress.new(client: @client, result: agent_ingress_result)
      expect(@agent_ingress == other).to eq true
    end
  end

  describe "#to_s" do
    it "stringifies as result.to_s" do
      expect(@agent_ingress.to_s).to eq agent_ingress_result.to_s
    end
  end

  describe "#delete" do
    it "calls delete on the client" do
      expect(@agent_ingress.client).to receive(:delete)
      @agent_ingress.delete
    end
  end

  describe "#update" do
    it "calls update on the client" do
      new_description = 'New description'
      new_metadata = 'New metadata'
      expect(@agent_ingress.client).to receive(:update)
      @agent_ingress.update(
        description: new_description,
        metadata: new_metadata
      )
      expect(@agent_ingress.description).to eq new_description
      expect(@agent_ingress.metadata).to eq new_metadata
    end
  end
end
