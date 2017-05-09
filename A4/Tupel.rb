class Tupel
  attr_reader :a, :b

  def initialize(a, b)
    @a = a
    @b = b
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    @a == other.a && @b == other.b
  end

  # anolog to ==
  def eql?(other)
    # use the overwriten method ==(other)
    self == other
  end

  def to_s
    "Tupel(#{@a},#{@b})"
  end

end

