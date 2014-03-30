class Currency
  attr_reader :code

  Instances = {}

  def initialize(code)
    @code = code
  end

  def self.load_currencies
    new("USD").store
  end

  def store
    Instances[code] = self
  end

  def self.get(code)
    Instances[code]
  end
end
