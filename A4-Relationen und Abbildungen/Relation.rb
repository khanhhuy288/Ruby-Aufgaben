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

  #=========== R ⊆ A x A ===========
  # für alle a ϵ set_a, (a,a) ϵ R
  def reflexiv?
    return false if @set_a != @set_b
    @set_a.all? { |element| @relation.include?(Tupel.new(element,element))}
  end

  # (a,b) ϵ R => (b,a) ϵ R
  def symmetrisch?
    return false if @set_a != @set_b
    @relation.all? { |tupel| @relation.include?(Tupel.new(tupel.b,tupel.a))}
  end

  # (a,b) ϵ R => (b,a) (not ϵ) R
  def asymmetrisch?
    return false if @set_a != @set_b
    @relation.all? { |tupel| not @relation.include?(Tupel.new(tupel.b,tupel.a))}
  end

  # (a,b) ϵ R und (b,a) ϵ R => a = b
  def anti_symmetrisch?
    # für alle (a,b) ϵ R muss es kein (b,a) geben, sonst muss a == b sein
    @relation.all? {|tupel| (not @relation.include?(Tupel.new(tupel.b,tupel.a))) || (tupel.a == tupel.b) }
  end

  # (a,b) ϵ R und (b,c) ϵ R => (a,c) ϵ R
  def transitiv?
    # für alle (a1,b1) und (a2,b2) ϵ R muss b1 != b2 sein, sonst muss a1 == b2 sein
    @relation.all? {|tupel_1|
      @relation.all? {|tupel_2|
        (not tupel_1.b == tupel_2.a) || include?(Tupel.new(tupel_1.a,tupel_2.b))
      }
    }
  end

  def rechts_eindeutig?
  end

  def links_eindeutig?
  end

  def rechts_total?
  end

  def links_total?
  end

  def verknuepfe
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


























