require 'Rechteck'
require 'Leinwand'

class Strasse
  #TODO
  def initialize(x, y, laenge, breite) 
    # zeichnet die Strasse 
    @die_strasse = Rechteck.new(x, y, laenge, breite, :grey, false)

    # zeichnet die Streifen mit einem Array 
    abstand = 100
    streifen_laenge = 50
    streifen_hoehe = 4
    streifen_farbe = :white
    basis_linie = y + breite/2 - streifen_hoehe/2
    pos_x = x
    
    @mittelstreifen = []
    while pos_x + streifen_laenge < x+laenge
      streifen =  Rechteck.new(pos_x, basis_linie, streifen_laenge, streifen_hoehe, streifen_farbe, false)
      pos_x += abstand
      @mittelstreifen << streifen
    end
    
  end
  
  def sichtbar_machen
    @die_strasse.sichtbar_machen
    @mittelstreifen.each{|i|  i.sichtbar_machen}
  end
  
  def laenge
    @die_strasse.breite
  end
  
  def breite
    @die_strasse.hoehe
  end
  
  def oben
    @die_strasse.obere_linke_ecke.y
  end
  
  def unten
    @die_strasse.obere_linke_ecke.y + breite
  end
  
  def rechts
    @die_strasse.obere_linke_ecke.x + laenge
  end
  
  def links
    @die_strasse.obere_linke_ecke.x
  end
  
  def abdunkeln
    @die_strasse.farbe_aendern('schwarz')
    @mittelstreifen.each{|i| i.farbe_aendern('hellgrau')}
  end
  
  def in_farbe_darstellen
    @die_strasse.farbe_aendern('grau')
    @mittelstreifen.each{|i| i.farbe_aendern('weiss')}
  end
 
end