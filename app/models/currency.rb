class Currency
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def eql?(other)
    self == other
  end

  def ==(other)
    other.equal?(other) ||
      (other.instance_of?(self.class) && other.code == code)
  end

  def hash
    code.hash
  end
end
