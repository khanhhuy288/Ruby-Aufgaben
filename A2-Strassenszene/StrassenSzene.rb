require 'Strasse'
require 'Leinwand'
require 'StrassenLaterne'
require 'Bus'

class StrassenSzene
  def initialize
    @strasse = Strasse.new(0, 200, 800, 200)
    @laterne1 = StrassenLaterne.new
    @laterne1.auf_position_setzen(20, 200)
    @laterne2 = StrassenLaterne.new
    @laterne2.auf_position_setzen(250, 200)
    @laterne3 = StrassenLaterne.new
    @laterne3.auf_position_setzen(480, 200)
    @laterne4 = StrassenLaterne.new
    @laterne4.auf_position_setzen(710, 200)
    @bus1 = Bus.new
    @bus1.auf_position_setzen(30, 285)
    @bus2 = Bus.new
    @bus2.auf_position_setzen(280, 285)
    @bus3 = Bus.new
    @bus3.auf_position_setzen(460, 285)
  end
  
  def sichtbar_machen
    @strasse.sichtbar_machen
    @laterne1.sichtbar_machen
    @laterne2.sichtbar_machen
    @laterne3.sichtbar_machen
    @laterne4.sichtbar_machen
    @bus1.sichtbar_machen
    @bus2.sichtbar_machen
    @bus3.sichtbar_machen
  end
  
  def in_tag_szene_aendern
    @strasse.in_farbe_darstellen
    @laterne1.in_farbe_aendern
    @laterne2.in_farbe_aendern
    @laterne3.in_farbe_aendern
    @laterne4.in_farbe_aendern
    @bus1.in_farbe_aendern
    @bus2.in_farbe_aendern
    @bus3.in_farbe_aendern
  end
  
  def in_nacht_szene_aendern
    @strasse.abdunkeln
    @laterne1.abdunkeln
    @laterne2.abdunkeln
    @laterne3.abdunkeln
    @laterne4.abdunkeln
    @bus1.abdunkeln
    @bus2.abdunkeln
    @bus3.abdunkeln
  end

  def einparken
    @bus1.einparken(@laterne1.rechts, @laterne2.links, 200)
    @bus2.einparken(@laterne2.rechts, @laterne3.links, 200)
    @bus3.einparken(@laterne3.rechts, @laterne4.links, 200)
  end

  def ausparken
    @bus1.ausparken(285)
    @bus2.ausparken(285)
    @bus3.ausparken(285)
  end

  def clear
    Leinwand.gib_einzige_instanz.alles_loeschen
  end
end