require './Potenzmenge'
require './Tupel'

class Relation
  # use for mixing in Enumerable Module
  include Enumerable

  attr_reader :set_a, :set_b

  def initialize(set_a, set_b)
    # make sure arguments are Set
    raise 'Ungültige Parameter' if !set_a.kind_of?(Set) || !set_b.kind_of?(Set)
    @set_a = set_a.clone
    @set_b = set_b.clone
    @relation = Set.new
  end

  def add(tupel)
    # make sure argument is Tupel
    if tupel.kind_of?(Tupel)
      # make sure Tupels are valid
      if set_a.include?(tupel.a) && set_b.include?(tupel.b)
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
  # für alle a ϵ A, (a,a) ϵ R
  def reflexiv?
    @set_a.all? { |element| @relation.include?(Tupel.new(element,element))}
  end

  # (a,b) ϵ R => (b,a) ϵ R
  def symmetrisch?
    @relation.all? { |tupel| @relation.include?(Tupel.new(tupel.b,tupel.a))}
  end

  # (a,b) ϵ R => (b,a) (not ϵ) R
  def asymmetrisch?
    @relation.all? { |tupel| not @relation.include?(Tupel.new(tupel.b,tupel.a))}
  end

  # (a,b) ϵ R und (b,a) ϵ R => a = b
  def anti_symmetrisch?
    # für alle (a,b) ϵ R muss es kein (b,a) geben, sonst muss a == b sein
    @relation.all? {|tupel| (not @relation.include?(Tupel.new(tupel.b,tupel.a))) || (tupel.a == tupel.b) }
  end

  # (a,b) ϵ R und (b,c) ϵ R => (a,c) ϵ R
  def transitiv?
    # für alle (a1,b1) und (a2,b2) ϵ R muss b1 != a2 sein, sonst muss (a1,b2) ϵ R
    @relation.all? {|tupel_1|
      @relation.all? {|tupel_2|
        (tupel_1.b != tupel_2.a) || @relation.include?(Tupel.new(tupel_1.a,tupel_2.b))
      }
    }
  end

  #=========== R ⊆ A x B ===========
  # für alle a ϵ A, (a,b) ϵ R und (a,c) ϵ R => b = c
  # für alle (a1,b1) und (a2,b2) gibt es NUR EINE a1 == a2
  def rechts_eindeutig?
    @relation.all? {|tupel_1|
      @relation.one? {|tupel_2|
        tupel_1.a == tupel_2.a
      }
    }
  end

  # für alle a ϵ A, (b,a) ϵ R und (c,a) ϵ R => b = c
  # für alle (a1,b1) und (a2,b2) gibt es NUR EINE b1 == b2
  def links_eindeutig?
    @relation.all? {|tupel_1|
      @relation.one? {|tupel_2|
        tupel_1.b == tupel_2.b
      }
    }
  end

  # für alle b ϵ B, existiert a ϵ A mit (a,b) ϵ R
  def rechts_total?
    return true if @relation.size == 0
    @set_b.all? {|element|
      @relation.any? {|tupel| tupel.b == element}
    }
  end

  # für alle a ϵ A, existiert b ϵ B mit (a,b) ϵ R
  def links_total?
    return true if @relation.size == 0
    set_a.all? {|element|
      @relation.any? {|tupel| tupel.a == element}
    }
  end

  def verknuepfe(andere_relation)
    raise 'Parameter ist keine Relation.' unless andere_relation.kind_of?(Relation)
    raise 'Mengen lassen sich nicht verknüpfen.' unless set_b == andere_relation.set_a
    new_relation = Relation.new(set_a, andere_relation.set_b)

    # add new Tupel when tupel_1's b == tupel_2's a
    @relation.each { |tupel_1|
      andere_relation.each { |tupel_2|
        if tupel_1.b == tupel_2.a
          new_relation.add(Tupel.new(tupel_1.a, tupel_2.b))
        end
      }
    }
    new_relation
  end

  def kopiere
    new_relation = Relation.new(set_a, set_b)

    # copy Tupel from current Relation to new Relation
    @relation.each { |tupel|
      new_relation.add(tupel)
    }
    new_relation
  end

  def reflexiver_abschluss
    raise 'Mengen sind nicht identisch. Kein reflexiver Abschluss.' unless set_a === set_b
    new_relation = kopiere
    # add reflexive Tupel to new Relation
    set_a.each { |element| new_relation.add(Tupel.new(element,element)) }

    new_relation
  end

  def symmetrischer_abschluss
    raise 'Mengen sind nicht identisch. Kein symmetrischer Abschluss.' unless set_a === set_b
    new_relation = kopiere
    # add symmetrische Tupel to new Relation
    # convert new Relation to Array to prevent modifying hash during iteration
    new_relation.to_a.each { |tupel| new_relation.add(Tupel.new(tupel.b,tupel.a)) }

    new_relation
  end

  def transitiver_abschluss
    raise 'Mengen sind nicht identisch. Kein symmetrischer Abschluss.' unless set_a === set_b
    new_relation = kopiere

    # keep adding transitive Tupel to new Relation until it's transitiv
    until new_relation.transitiv?
      new_relation.to_a.each { |tupel_1|
        new_relation.to_a.each { |tupel_2|
          if tupel_1.b == tupel_2.a
            new_relation.add(Tupel.new(tupel_1.a,tupel_2.b))
          end
        }
      }
    end

    new_relation
  end

  def invertiere
    # create new Relation from set_b to set_a
    new_relation = Relation.new(set_b, set_a)

    # add Tupel from current Relation to new Relation, a and b of Tupel switch places
    @relation.each { |tupel|
      new_relation.add(Tupel.new(tupel.b,tupel.a))
    }
    new_relation
  end

  #=========== Abbildung ===========
  def abbildung?
    links_total? && rechts_eindeutig?
  end

  def injektiv?
    abbildung? && links_eindeutig?
  end

  def surjekiv?
    abbildung? && rechts_total?
  end

  def bijektiv?
    injektiv? && surjekiv?
  end

  def urbild
    # make sure Relation is Abbildung
    raise 'Relation ist keine Abbildung.' unless abbildung?

    # create new Relation from Potenzmenge of set_b to Potenzmenge of set_a
    p_set_a = set_a.p_menge
    p_set_b = set_b.p_menge
    new_relation = Relation.new(p_set_b, p_set_a)

    # find the Urbildmenge for every Teilmenge der Potenzmenge of set_b
    new_relation.set_a.each { |element_set_a|
      # select element from set_a that's equal to a in (a,b)ϵR and b ϵ current Teilmenge der Potenzmenge of set_b
      element_set_b = Set.new(set_a.select { |element| @relation.any? {|tupel| element == tupel.a && element_set_a.include?(tupel.b)} })
      new_relation.add(Tupel.new(element_set_a, element_set_b))
    }

    new_relation
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    self.all? { |tupel| other.include?(tupel) } && other.all? { |tupel| self.include?(tupel) }
  end

  def eql?(other)
    self == other
  end
    
  def to_s
    # return empty Relation when Relation's size equal 0
    return 'Relation{}' if size == 0

    # map elements from Relation to an array
    relation_s = "Relation{#{@relation.map { |x| x.to_s }}}"

    # remove square brackets and double quotes
    relation_s.delete('[]"')
  end

end

























