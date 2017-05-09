require './Potenzmenge'
require './Tupel'

class Relation
  # use for mixing in Enumerable Module
  include Enumerable

  attr_reader :set_a, :set_b

  def initialize(set_a, set_b)
    # make sure arguments are Set
    raise 'Ungültige Parameter' unless set_a.kind_of?(Set) || set_b.kind_of?(Set)
    @set_a = set_a.clone
    @set_b = set_b.clone
    @relation = Set.new
  end

  def add(tupel)
    # make sure argument is Tupel
    if tupel.kind_of?(Tupel)
      # make sure Tupels are valid
      if @set_a.include?(tupel.a) && @set_b.include?(tupel.b)
        @relation.add(tupel)
      end
    end

    # return old Relation if Tupel is not valid 
    self
  end

  def size
    @relation.size
  end

  # mix in Enumerable Module's methods
  def each(&block)
    @relation.each(&block)
  end

  def reflexiv?
  end

  def symmetrisch?
  end

  def asymmetrisch?
  end

  def anti_symmetrisch?
  end

  def transitiv?
  end

  def rechts_eindeutig?
  end

  def links_eindeutig?
  end

  def rechts_total?
  end

  def links_total?
  end


  def to_s
    # return empty Relation when Relation's size equal 0
    return 'Relation{}' if size == 0

    # map elements from Relation to an array
    relation_s = "Relation{#{self.map { |x| x.to_s }}}"

    # remove square brackets and double quotes
    relation_s.delete!('[]"')
  end

end


























