$CLASSES = [ :StrassenSzene, :Strasse, :Bus, :StrassenLaterne ]

#
# Methodenspezifikation fuer die Objekt- und Klassen-methoden der Klassen der Toolbox
#

$METHOD_CONFIG = {
  :StrassenSzene => {
  :sichtbar_machen => { :label => :sichtbar_machen },
  :in_tag_szene_aendern => { :label => :in_tag_szene_aendern },
  :in_nacht_szene_aendern => { :label => :in_nacht_szene_aendern },
  :einparken => {:label => :einparken},
  :ausparken => {:label => :ausparken},
  :clear => {:label => :clear}
  },
  :StrassenSzene_class => {
  :new => { :label => :'new()' },
  },
  :Bus => {
  :sichtbar_machen => { :label => :sichtbar_machen },
  :unsichtbar_machen => { :label => :unsichtbar_machen },
  :laenge => {:label => :laenge, :ergebnis => :Integer},
  :breite => {:label => :breite, :ergebnis => :Integer},
  :position => {:label => :position, :ergebnis => :Point},
  :auf_position_setzen => {:label => :auf_position_setzen, :args => [[:x, :Integer] ,[:y,:Integer]]},
  :nach_vorne_fahren =>  { :label => :nach_vorne_fahren, :args => [[:wdh, :Integer],[:wdh_nach, :Integer],[:starten_nach, :Integer]]},
  :nach_unten_fahren =>  { :label => :nach_unten_fahren, :args => [[:wdh, :Integer],[:wdh_nach, :Integer],[:starten_nach, :Integer]]},
  :nach_oben_fahren =>  { :label => :nach_oben_fahren, :args => [[:wdh, :Integer],[:wdh_nach, :Integer],[:starten_nach, :Integer]]},
  :bewegen => { :label => :'bewegen(...)' ,
  :args => [
  [:'x_delta', :Integer],
  [:'y_delta', :Integer],
  [:'wiederholungen', :Integer],
  [:'wiederholen_nach [ms]', :Integer],
  [:'starten_nach [ms]', :Integer]] },
  :einparken =>  { :label => :'einparken(...)', :args => [[:x_links, :Integer],[:x_rechts, :Integer],[:y, :Integer]]},
  :ausparken =>  { :label => :ausparken, :args => [[:fahrlinie, :Integer]]},
  :abdunkeln =>  { :label => :abdunkeln},
  :in_farbe_aendern =>  { :label => :in_farbe_aendern}},
  :Bus_class => {
  :new => { :label => :'new()' },
  },
  :StrassenLaterne => {
  :sichtbar_machen => { :label => :sichtbar_machen },
  :unsichtbar_machen => { :label => :unsichtbar_machen },
  :breite => {:label => :breite, :ergebnis => :Integer},
  :bewegen => { :label => :'bewegen(...)' ,
  :args => [
  [:'x_delta', :Integer],
  [:'y_delta', :Integer],
  [:'wiederholungen', :Integer],
  [:'wiederholen_nach [ms]', :Integer],
  [:'starten_nach [ms]', :Integer]] },
  # :position Name der Methode im Quelltext
  # :label => 'position() Name der Methode im Kontextmenu des Objektes
  # :ergebnis => Point Methode, die ein Ergebnis liefert hier wird ein Point Objekt zurückgegeben
  :position => {:label => :position, :ergebnis => :Point},
  :auf_position_setzen => { :label => :'auf_position_setzen(...)' , :args => [ [:'pos_x', :Integer], [:'pos_y', :Integer] ] },
  # :leucht_farbe_aendern Name der Methode im Quelltext
  # :label => 'leucht_farbe_aendern(...) Name der Methode im Kontextmenu des Objektes
  # :args => [ [:neue_:farbe , :String]] Parameter der Methode (> 1 Parameter möglich)
  :einschalten => { :label => :einschalten},
  :ausschalten => { :label => :ausschalten }
  },
  # Konfiguration der Klassenmethoden von StrassenLaterne
  :StrassenLaterne_class => {
  :new => { :label => :'new()' },
  },
  :Strasse => { # :ergebnis =>  :String
  :laenge => {:label => :laenge, :ergebnis => :Integer},
  :breite => {:label => :breite, :ergebnis => :Integer},
  :oben => {:label => :oben, :ergebnis => :Integer},
  :unten => {:label => :unten, :ergebnis => :Integer},
  :rechts => {:label => :rechts, :ergebnis => :Integer},
  :links => {:label => :links, :ergebnis => :Integer},
  :sichtbar_machen => { :label => :sichtbar_machen },
  :abdunkeln => {:label => :abdunkeln},
  :in_farbe_darstellen => {:label => :in_farbe_darstellen}
  },
  :Strasse_class  => {
  :new => { :label => :'new()', :args => [[:x,:Integer],[:y,:Integer],[:laenge, :Integer],[:breite , :Integer]] },
  },
}

