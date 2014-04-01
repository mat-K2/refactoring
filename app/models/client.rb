class Client
  def initialize(row)
    @row = row
  end

  def name
    @row.name
  end

  def name=(value)
    @row.name = value
  end

  def wins
    @row.wins.to_i
  end

  def wins=(value)
    @row.wins = value
  end
end
