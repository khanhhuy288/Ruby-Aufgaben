require 'Strasse'
require 'Leinwand'
require 'StrassenLaterne'
require 'Bus'

class StrassenSzene
  def initialize
    @strasse = Strasse.new(0, 500, 800, 200)
    @laterne1 = StrassenLaterne.new
    @laterne1.auf_position_setzen(@strasse.links + 20, @strasse.oben)
    @laterne2 = StrassenLaterne.new
    @laterne2.auf_position_setzen(@strasse.links + 250, @strasse.oben)
    @laterne3 = StrassenLaterne.new
    @laterne3.auf_position_setzen(@strasse.links + 480, @strasse.oben)
    @laterne4 = StrassenLaterne.new
    @laterne4.auf_position_setzen(@strasse.links + 710, @strasse.oben)
    @bus1 = Bus.new
    @bus1.auf_position_setzen(@strasse.links + 30, fahrlinie)
    @bus2 = Bus.new
    @bus2.auf_position_setzen(@strasse.links + 280, fahrlinie)
    @bus3 = Bus.new
    @bus3.auf_position_setzen(@strasse.links + 460, fahrlinie)
  end
  
  def fahrlinie
    @strasse.oben + @strasse.breite/3 + @strasse.breite/7
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
    @bus1.einparken(@laterne1.rechts, @laterne2.links, @strasse.oben)
    @bus2.einparken(@laterne2.rechts, @laterne3.links, @strasse.oben)
    @bus3.einparken(@laterne3.rechts, @laterne4.links, @strasse.oben)
  end

  def ausparken
    @bus1.ausparken(fahrlinie)
    @bus2.ausparken(fahrlinie)
    @bus3.ausparken(fahrlinie)
  end

  def clear
    Leinwand.gib_einzige_instanz.alles_loeschen
  end
end