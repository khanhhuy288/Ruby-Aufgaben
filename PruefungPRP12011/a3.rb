class Object
  def abstract()
    raise AbstractMethodError
  end

  class AbstractMethodError < StandardError
  end
end

#  TODO Klassenmodell entwerfen
module Mitarbeiter
  def initialize(name, nr, gehalt)
    @name = name
    @nr = nr
    @gehalt = gehalt
  end

  def jahres_gehalt
    @gehalt + bonus
  end

  def bonus
    abstract
  end
  
  def berichts_ebene
    abstract 
  end

end

class Angestellte
  include Mitarbeiter
  def initialize(name, nr, gehalt)
    super(name, nr, gehalt)
  end
  def bonus
    @gehalt
  end

  def to_s()
    "A(#{@name})"
  end
  
  def berichts_ebene
    0 
  end
end

class Manager
  include Mitarbeiter
  def initialize(name, nr, gehalt)
    super(name, nr, gehalt)
    @personen = []
  end
  
  def << ma
    @personen << ma
  end

  def bonus
    
  end
  
  def berichts_ebene
     
  end

  def to_s()
    "M(#@name,#{@mas.join(",")})"
  end
end

