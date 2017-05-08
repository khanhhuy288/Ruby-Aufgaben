require 'Set'

# Änderungen an der Klasse Set für eine bessere Darstellung
# und korrektem Inhaltsvergleich für Mengen von Mengen

class Set

  def ==(other)
    # return false if compared with a nil object
    return false if other.nil?

    # return true if compared to the object itself
    return true if self.equal?(other)

    # return true if current set is Teilmenge von other set
    self.all?{|e| other.include?(e)}
  end

  # anolog to ==
  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    self.all?{|e| other.include?(e)}
  end

  # set a hash
  def hash
    prime = 31
    self.inject(1){|acc,x|
      prime*acc + x.hash
    }
  end

  def to_s
    # return empty set when set's size equal 0
    return 'Set{}' if size == 0

    # map elements from set to an array
    r = "Set{#{self.map{|x| x }}}"
    # delete [ and ]
    r.delete!('[]')
    r
  end
end


class Potenzmenge
  
  include Enumerable
  
  def initialize(a_set)

    @potenz = Set.new(a_set.inject(Set.new.add(Set.new)){|acc,s|
      r = Set.new
      acc.each{|set| r.add(set);  r.add(set.clone.add(s)) }
      r
    })
  end

  def each(&b)
    @potenz.each(&b)
  end

  def to_s
    "#{@potenz}"
  end

  def inspect
    @potenz.inspect
  end
  
  def size
    @potenz.size
  end
end

p = Potenzmenge.new(Set.new([1,2,3,4]))

set_a = Set.new([5, 2, 9])
set_b = Set.new([5, 2, 9, 10])

