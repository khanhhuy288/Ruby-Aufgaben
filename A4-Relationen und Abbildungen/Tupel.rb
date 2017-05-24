class Tupel
  attr_reader :a, :b
  def initialize(a, b)
    @a = a
    @b = b
  end

  def reverse
    Tupel.new(@b,@a)
  end
  
  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@a,@b] == [other.a,other.b]
    #@a == other.a && @b == other.b 
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@a,@b].eql?([other.a,other.b])
    #@a.eql?(other.a) && @b.eql?(other.b)
  end

  def hash
    @a.hash + @b.hash
  end

  def to_s
    "(#{@a},#{@b})"
  end

end



