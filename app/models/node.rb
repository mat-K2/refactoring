class Node
  def initialize(id, networks)
    @id = id
    @networks = networks
  end

  def network
    @networks.find { |network| network.node_id == @id }
  end
end
