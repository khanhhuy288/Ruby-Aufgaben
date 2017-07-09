# 10 Pkt
class Kasse
  include Enumerable
  #TODO 's nach Aufgabenstellung
  def initialize
    @rechnungen = []
  end
  
  def each(&block)
    @rechnungen.each(&block)
  end
  
  def produkt_haeufigkeiten
    result = {}   
    
    each { |rechnung|
      rechnung.each { |position|
        result[position.produkt] = 0 if !result.has_key?(position.produkt)
        result[position.produkt] += position.anzahl
      }
    }  
      
    result
  end
  
  # Gegeben
  def <<(rechnung)
    @rechnungen << rechnung
    return self
  end

  # Gegeben
  def kassen_sturz()
    self.inject(0) {|akku,rechnung| akku + rechnung.rechnungs_betrag()}
  end

  # Gegeben
  def to_s()
    return "Kasse:\n #{@rechnungen.join("\n ")}\n Gesamt:#{kassen_sturz()}"
  end

end

# 15 Pkt
class Rechnung
  include Enumerable
  include Comparable
  # Gegeben
  attr_reader :positionen,:nr
  protected :positionen
  def self.reset()
    if self.class_variables().size() > 0
      var = class_variables[0]
      self.class_variable_set(var,0)
    end
  end

  # TODO 's nach Aufgabenstellung
  @@count = 0

  def initialize
    @@count += 1
    @nr = @@count
    @positionen = []
  end

  def each(&block)
    @positionen.each(&block)
  end

  def rechnungs_betrag
    inject(0) { |sum, produkt| sum + produkt.preis }
  end
  
  def count 
    inject(0) { |sum, produkt| sum + produkt.anzahl }
  end

  def <=> other
    rechnungs_betrag <=> other.rechnungs_betrag
  end
  
  # Gegeben
  def << pos
    @positionen << pos
    return self
  end

  def to_s()
    return "R#{@nr}:(#{rechnungs_betrag()}):#{count}/#{@positionen.size}:#{@positionen.join(",")}"
  end
end

# 5 Pkt
class Position
  include Comparable
  # Gegeben
  attr_reader :preis,:produkt,:anzahl
  #TODO 's nach Aufgabenstellung
  def initialize(produkt, anzahl, einzelpreis)
    @produkt = produkt
    @anzahl = anzahl
    @preis = einzelpreis * anzahl
  end

  def <=> other
    [preis, produkt] <=> [other.preis, other.produkt]
  end

  def to_s()
    return "#{@produkt}(#{@anzahl}):#{preis}"
  end
end

