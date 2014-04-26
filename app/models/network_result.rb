class NetworkResult
  attr_reader :old_networks, :nodes
  attr_accessor :name

  def initialize
    @old_networks, @nodes = [], []
  end

  def name
    @old_networks.collect { |network| network.name }.join(" - ")
  end
end
