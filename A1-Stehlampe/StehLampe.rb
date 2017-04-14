require "Kreis"
require "Dreieck"
require "Rechteck"

class StehLampe
  
  # Eine Stehlampe setzt sich aus den Komponenten
  # Schirm, Stiel, Fuss und 4 Leuchtstrahlen zusammen
  # Die Komponenten der Stehlampe sind geometrische Objekte der
  # Klassen Kreis, Rechteck, Dreieck.
  # Diese Objekte müssen mit der richtigen Farbe, Größe und Position
  # erzeugt werden, damit die Zusammenstellung eine Stehlampe ergibt.
  def initialize()
    @schirm = Kreis.new(120,60,40,"yellow",false)
    @stiel = Rechteck.new(116,90,10,80,"green",false)
    @fuss = Rechteck.new(84,165,70,15,"blue",false)
    @leuchtstrahl1 = Rechteck.new(90,97,3,25,"yellow",false)
    @leuchtstrahl2 = Rechteck.new(100,97,3,25,"yellow",false)
    @leuchtstrahl3 = Rechteck.new(135,97,3,25,"yellow",false)
    @leuchtstrahl4 = Rechteck.new(145,97,3,25,"yellow",false)
  end

  # Eine Stehlampe wird sichtbar, wenn alle Komponenten 
  # der Stehlampe sichtbar gemacht werden
  def sichtbar_machen()
    @fuss.sichtbar_machen()
    @stiel.sichtbar_machen()
    @schirm.sichtbar_machen()
    @leuchtstrahl1.sichtbar_machen()
    @leuchtstrahl2.sichtbar_machen()
    @leuchtstrahl3.sichtbar_machen()
    @leuchtstrahl4.sichtbar_machen()
  end
# Eine Stehlampe wird unsichtbar wenn alle komponenten
  # der Stehlampe unsichtbar gemacht werden
  def unsichtbar_machen()
    @fuss.unsichtbar_machen()
    @stiel.unsichtbar_machen()
    @schirm.unsichtbar_machen()
    @leuchtstrahl1.unsichtbar_machen()
    @leuchtstrahl2.unsichtbar_machen()
    @leuchtstrahl3.unsichtbar_machen()
    @leuchtstrahl4.unsichtbar_machen()
  end
  # TODO
  # vertikal_bewegen(anzahl_punkte)
  # Eine Stehlampe wird vertikal bewegt, indem alle
  # Komponenten vertikal bewegt werden.
  #
  # Parameter:
  #   anzahl_punkte - gibt an um wieviele Punkte verschoben werden soll
  def vertikal_bewegen(anzahl_punkte)
    @fuss.vertikal_bewegen(anzahl_punkte)
    @stiel.vertikal_bewegen(anzahl_punkte)
    @schirm.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl1.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl2.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl3.vertikal_bewegen(anzahl_punkte)
    @leuchtstrahl4.vertikal_bewegen(anzahl_punkte)
  end

  # TODO
  # horizontal_bewegen(anzahl_punkte)
  # Eine Stehlampe wird horizontal bewegt, indem alle
  # Komponenten horizontal bewegt werden.
  #
  # Parameter:
  #   anzahl_punkte - gibt an um wieviele Punkte verschoben werden soll
  def horizontal_bewegen(anzahl_punkte)
    @fuss.horizontal_bewegen(anzahl_punkte)
    @stiel.horizontal_bewegen(anzahl_punkte)
    @schirm.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl1.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl2.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl3.horizontal_bewegen(anzahl_punkte)
    @leuchtstrahl4.horizontal_bewegen(anzahl_punkte)
  end

  # TODO
  # bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
  # Bewegt die Stehlampe wdh-mal in Richtung delta_x, delta_y. Die Geschwindigkeit der
  # Bewegung wird über den Parameter wdh_nach gesteuert. Ist wdh_nach = 10, dann bedeutet dies,
  # dass die Bewegung in delta_x, delta_y Richtung alle 10 ms wiederholt wird.
  # Die gesamte Bewegung startet nach starten_nach. 
  #
  # Wenn die Stehlampe sichtbar ist, dann wird diese animiert über den Bildschirm bewegt
  #
  # Eine Stehlampe wird bewegt, indem alle Komponenten gleichförmig bewegt werden.
  #
  # Parameter:
  #   delta_x - Bewegung in x-Richtung
  #   delta_y - Bewegung in y-Richtung
  #   wdh - Anzahl der Einzel-Bewegungen in delta_x,delta_y Richtung 
  #   wdh_nach - Zeit zwischen zwei Einzelbewegungen in ms
  #   starten_nach - Zeitspanne ab der aktuellen Zeit, bis die gesamte Bewegung beginnt
  #
  def bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
      @fuss.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
      @stiel.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
      @schirm.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
      @leuchtstrahl1.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
      @leuchtstrahl2.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
      @leuchtstrahl3.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
      @leuchtstrahl4.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    end
  
  
  # Zum Ändern der Leuchtfarbe werden alle Leuchtstrahlen in die neue Farbe geändert
  def leucht_farbe_aendern(farbe)
    @leuchtstrahl1.farbe_aendern(farbe)
    @leuchtstrahl2.farbe_aendern(farbe)
    @leuchtstrahl3.farbe_aendern(farbe)
    @leuchtstrahl4.farbe_aendern(farbe)
  end


  # TODO 
  # Die Methode liefert die Position der Stehlampe zurück
  #
  # Die Position der Stehlampe ist definiert als
  # linke untere Ecke des Stehlampenfußes
  #
  def position()
    return @fuss.obere_linke_ecke + Point.new(0, @fuss.hoehe)
  end 
   
  # TODO
  # auf_position_setzen(ziel_pos_x,ziel_pos_y)
  # Verschiebt die Stehlampe so, dass die linke untere Ecke des Fußes die Position
  # (ziel_pos_x,ziel_pos_y) hat.
  #
  # Parameter
  #   ziel_pos_x - die x-Koordinate der linken unteren Ecke des Fusses der Stehlampe
  #   ziel_pos_y - die y-Koordinate der linken unteren Ecke des Fusses der Stehlampe
  def auf_position_setzen(ziel_pos_x,ziel_pos_y)
    bewegen(ziel_pos_x-position.x, ziel_pos_y-position.y, 1, 0, 0)
  end

  # TODO 
  # einschalten
  # 
  # Schaltet die Stehlampe ein. Beim Einschalten werden der Lampenschirm und
  # die Leuchtstrahlen gelb. 
  def einschalten() 
    @schirm.farbe_aendern('gelb')
    @leuchtstrahl1.sichtbar_machen()
    @leuchtstrahl2.sichtbar_machen()
    @leuchtstrahl3.sichtbar_machen()
    @leuchtstrahl4.sichtbar_machen()
    @leuchtstrahl1.farbe_aendern('gelb')
    @leuchtstrahl2.farbe_aendern('gelb')
    @leuchtstrahl3.farbe_aendern('gelb')
    @leuchtstrahl4.farbe_aendern('gelb')
  end
  
  # TODO
  # ausschalten
  #
  # Schaltet die Stehlampe aus. Beim Ausschalten wird der Lampenschirm orange
  # und die Leuchtstrahlen werden unsichtbar
  def  ausschalten()
    @schirm.farbe_aendern('orange')
    @leuchtstrahl1.unsichtbar_machen()
    @leuchtstrahl2.unsichtbar_machen()
    @leuchtstrahl3.unsichtbar_machen()
    @leuchtstrahl4.unsichtbar_machen()
  end
  def to_s()
    "Stehlampe (#{@nummer})"
  end
end