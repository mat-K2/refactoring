class Client
  def initialize(row)
    @row = row
  end

  def name
    @row[0]
  end

  def name=(value)
    @row[0] = value
  end

  def wins
    @row[1].to_i
  end

  def wins=(value)
    @row[1] = value
  end
end
