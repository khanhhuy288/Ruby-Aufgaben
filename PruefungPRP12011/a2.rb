# 26 Pkt
# 4 Pkt für sortiere_absteigend_nach_strasse_hnr

#TODO Klasse um die Methoden ergänzen
class Adresse
  include Comparable
  attr_reader :strasse, :hnr, :plz, :ort
  def initialize(strasse,hnr,plz,ort)
    @strasse = strasse
    @hnr = hnr
    @plz = plz
    @ort = ort
  end

  def to_s()
    "A(#@strasse,#@hnr,#@plz,#@ort)"
  end

  def <=> other
    raise ArgumentError if !other.is_a?(Adresse)
    [plz, ort, strasse, hnr] <=> [other.plz, other.ort, other.strasse, other.hnr]
  end

  def == other
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [plz, ort, strasse, hnr] == [other.plz, other.ort, other.strasse, other.hnr]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [plz, ort, strasse, hnr].eql?([other.plz, other.ort, other.strasse, other.hnr])
  end

  def hash
    plz.hash + ort.hash + strasse.hash + hnr.hash
  end
end

def sortiere_absteigend_nach_strasse_hnr(adresse_ary)
  # TODO
  return adresse_ary.sort { |a, b| [b.strasse, b.hnr] <=> [a.strasse, a.hnr] }
end


