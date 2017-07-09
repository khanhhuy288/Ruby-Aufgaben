# 25 Pkt fuer Loesung Aufgabenteil A
# 5 Pkt fuer Loesung Aufgabenteil B

class Kasse

  # Gegeben
  attr_reader :rechnungen
  attr_writer :rechnungen
  protected :rechnungen
  # TODO 's nach Aufgabenstellung
  def initialize 
    @rechnungen = []
  end
  
  def == other
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    rechnungen == other.rechnungen
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    rechnungen.eql?(rechnungen)
  end

  def hash 
    @rechnungen.hash
  end
  
  # Gegeben
  def <<(rechnung)
    @rechnungen << rechnung
    return self
  end

  def size()
    return @rechnungen.size()
  end

  def to_s()
    return "Kasse:\n #{@rechnungen.join("\n ")}}"
  end
  
  def clone 
    copy = super 
    copy.rechnungen = @rechnungen.map { |rechnung| rechnung.clone }
    copy
  end
end

class Rechnung
  # Gegeben
  attr_reader :positionen,:nr
  attr_writer :positionen
  protected :positionen
  # TODO 's nach Aufgabenstellung
  def initialize(nr)
    @nr = nr
    @positionen = []
  end
  
  def == other
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@nr, @positionen] == [other.nr, other.positionen]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@nr, @positionen].eql?([other.nr, other.positionen])
  end

  def hash 
    @nr.hash + @positionen.hash
  end

  # Gegeben
  def <<(pos)
    @positionen << pos
    return self
  end

  def to_s(abbr=false)
    if abbr
      return "R#{@nr}"
    end
    return "R#{@nr}:#{@positionen.join(",")}"
  end
  
  def clone 
    copy = super 
    copy.positionen = @positionen.map { |position| position.clone }
    copy
  end
end

# 5 Pkt
class Position

  attr_reader :preis
  # Gegeben
  def produkt
    @produkt.clone()
  end

  # TODO 's nach Aufgabenstellung
  def initialize(produkt, preis)
    @produkt = produkt
    @preis = preis
  end

  def == other
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@produkt, @preis] == [other.produkt, other.preis]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [@produkt, @preis].eql?([other.produkt, other.preis])
  end

  def hash 
    @produkt.hash + @preis.hash
  end
  
  def to_s()
    return "#{@produkt}:#{preis}"
  end
end






