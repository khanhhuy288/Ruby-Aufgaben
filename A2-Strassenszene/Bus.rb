require 'Rechteck'
require 'Kreis'

class Bus
 def initialize
  @fahrgestell = Rechteck.new(50, 50, 70, 50,"blue", false)
  @kabine = Rechteck.new(120, 78, 12, 22,"blue", false)
  @fenster1 = Rechteck.new(52, 52, 20, 25, "white", false)
  @fenster2 = Rechteck.new(75, 52, 20, 25, "white", false)
  @fenster3 = Rechteck.new(98, 52, 20, 25, "white", false)
  @rad1 = Kreis.new(70, 100, 12, "red", false)
  @rad2 = Kreis.new(110, 100, 12, "red", false)
   
 end
 
 def sichtbar_machen 
   @fahrgestell.sichtbar_machen
   @kabine.sichtbar_machen
   @fenster1.sichtbar_machen
   @fenster2.sichtbar_machen
   @fenster3.sichtbar_machen
   @rad1.sichtbar_machen
   @rad2.sichtbar_machen
 end
 
 def breite
   @fahrgestell.breite + @kabine.breite
 end
 
 def hoehe
   @fahrgestell.hoehe + @rad1.radius
 end
 
 # untere linke Ecke
 def position
   @fahrgestell.obere_linke_ecke + Point.new(0, hoehe)
 end
 
  def bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @fahrgestell.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @kabine.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @fenster1.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @fenster2.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @fenster3.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @rad1.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @rad2.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
  end
 
  def auf_position_setzen(ziel_pos_x,ziel_pos_y)
    bewegen(ziel_pos_x - position.x, ziel_pos_y - position.y, 1,0,0)
  end
 
  # bewegt 1px nach vorne
  def nach_vorne_fahren(wdh,wdh_nach,starten_nach)
    bewegen(1,0, wdh,wdh_nach,starten_nach)
  end
 
  def nach_unten_fahren(wdh,wdh_nach,starten_nach)
    bewegen(0,1, wdh,wdh_nach,starten_nach)
  end
  
  def nach_oben_fahren(wdh,wdh_nach,starten_nach)
    bewegen(0,1, wdh,wdh_nach,starten_nach)
  end
 
  def einparken (x_links, x_rechts, y)
    # bewegt in x-Richtung 
    bewegen((x_rechts+x_links)/2 - breite/2 - position.x, 0, 1,0,0)
    # beweg in y-Richtung 
    bewegen(0, y - position.y, 1,0,1000)
  end 
  
  def ausparken (fahrlinie)
    bewegen(0, fahrlinie - position.y, 1,0,0)
  end
  
  def abdunkeln
    @fenster1.farbe_aendern('grau')
    @fenster2.farbe_aendern('grau')
    @fenster3.farbe_aendern('grau')
    @fahrgestell.farbe_aendern('hellgrau')
    @kabine.farbe_aendern('hellgrau')
    @rad1.farbe_aendern('hellgrau')
    @rad2.farbe_aendern('hellgrau')
    
  end
  
  def in_farbe_aendern
    @fahrgestell.farbe_aendern('blau')
    @kabine.farbe_aendern('blau')
    @fenster1.farbe_aendern('weiss')
    @fenster2.farbe_aendern('weiss')
    @fenster3.farbe_aendern('weiss')
    @rad1.farbe_aendern('rot')
    @rad2.farbe_aendern('rot')
  end
  
end