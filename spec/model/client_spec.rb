require 'spec_helper'

describe Client do
  let(:new_network) { { :nodes => [], :old_networks => [] } }
  let(:network_1) { Network.new(1, "net_1") }
  let(:network_2) { Network.new(2, "net_2") }
  let(:network_3) { Network.new(3, "net_3") }
  let(:networks) { [
      network_1,
      network_2,
      network_3
    ]}
  let(:node) { Node.new(1, networks) }

  describe "add old_networks" do
    before do
      new_network[:old_networks] << node.network
    end
    it { new_network[:old_networks].should == [network_1] }
  end

  describe "add nodes" do
    before do
      new_network[:nodes] << node
    end
    it { new_network[:nodes].should == [node] }
  end

  describe "add name" do
    before do
      new_network[:old_networks] << network_1
      new_network[:old_networks] << network_2
      new_network[:old_networks] << network_3
      new_network[:name] = new_network[:old_networks].collect do |network|
        network.name
      end.join(" - ")
    end
    it { new_network[:name].should == "net_1 - net_2 - net_3" }
  end
end
