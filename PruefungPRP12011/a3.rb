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
    @gehalt * 12.0 + bonus
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
    @mas = []  
  end
  
  def << ma
    @mas << ma
  end

  def bonus
    @mas.inject(0) { |sum, ma| sum + ma.bonus } / mas_num * 1.8
  end
  
  def mas_num 
    result = 0 
    @mas.each { |ma|
      result += 1
      if ma.is_a?(Manager)
        result += ma.mas_num
      end
    }
    puts result
    result
  end
  
  def berichts_ebene
    @mas.max { |a, b| a.berichts_ebene <=> b.berichts_ebene }.berichts_ebene + 1
  end

  def to_s()
    "M(#@name,#{@mas.join(",")})"
  end
end

