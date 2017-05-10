class Tupel
  attr_reader :a, :b

  def initialize(a, b)
    @a = a
    @b = b
  end
  
  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    @a == other.a && @b == other.b
  end

  def eql?(other)
    self == other
  end
  
  def hash
    @a.hash + @b.hash
  end
  
  def to_s
    "(#{@a},#{@b})"
  end

end

