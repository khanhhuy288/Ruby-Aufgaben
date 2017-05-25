class Kasse
  include Enumerable 
  
  def initialize
    @rechnungen = []
  end

  def each(&block)
    @rechnungen.each(&block)
  end

  def produkt_haeufigkeiten
    self.inject(Hash.new(0)) { |hash,produkt| hash[produkt] += 1; hash} 
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


class Rechnung
  include Enumerable
  
  # Gegeben
  attr_reader :positionen,:nr
  protected :positionen
  def self.reset()
    if self.class_variables().size() > 0
      var = class_variables[0]
      self.class_variable_set(var,0)
    end
  end

  def initialize(nr)
    @nr = nr
    @positionen = []
  end

  def each(&block)
    @positionen.each(&block)
  end

  def rechnungs_betrag
    self.inject(0) { |akku, pos| akku + pos.preis }
  end

  def count
    self.inject(0) { |akku, pos| akku + pos.anzahl }
  end

  # Gegeben
  def << pos
    @positionen << pos
    return self
  end

  def to_s
    return "R#{@nr}:(#{rechnungs_betrag()}):#{count}/#{@positionen.size}:#{@positionen.join(",")}"
  end
end

class Position

  attr_reader :preis,:produkt,:anzahl
  def initialize(produkt,anzahl,einzelpreis)
    @preis = einzelpreis * anzahl
    @produkt = produkt
    @anzahl = anzahl
  end

  def to_s()
    return "#{@produkt}(#{@anzahl}):#{preis}"
  end
end

pos1 = Position.new('Chicken', 5, 12)
pos2 = Position.new('Soup', 6, 24)
pos3 = Position.new('Burger', 3, 19)
pos4 = Position.new('Soup', 8, 12)
pos5 = Position.new('Burger', 9, 24)
pos6 = Position.new('Chicken', 12, 19)

rechnung1 = Rechnung.new(1) << pos1 << pos2 << pos3
rechnung2 = Rechnung.new(2) << pos4 << pos3 << pos2
rechnung3 = Rechnung.new(3) << pos6 << pos6 << pos6
rechnung4 = Rechnung.new(4) << pos4 << pos5 << pos4

my_kasse = Kasse.new << rechnung1 << rechnung2 << rechnung3 << rechnung4

puts my_kasse











