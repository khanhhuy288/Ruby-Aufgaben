require './Potenzmenge'

class Relation < Set
  attr_reader :set_a, :set_b

  # set_a ~ Ausgangmenge, set_b ~ Zielmenge
  def initialize(set_a, set_b)
    # make sure arguments are Set
    raise 'Ungültige Parameter' unless set_a.kind_of?(Set) || set_b.kind_of?(Set)
    super []
    @set_a = set_a.clone
    @set_b = set_b.clone
  end

  def add(tupel)
    # check if argument is Tupel
    if tupel.kind_of?(Tupel)
      if @set_a.include?(tupel.a) && @set_b.include?(tupel.b)
        super tupel
      end
    end

    # return relation without adding anything
    self
  end

  def reflexiv?
    return false if @set_a != @set_b
    @set_a.all? {|element| include?(Tupel.new(element,element))}
  end


end