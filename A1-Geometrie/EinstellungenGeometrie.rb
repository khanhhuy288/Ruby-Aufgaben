$CLASSES = [ :Kreis, :Dreieck, :Rechteck ]

#
# Methodenspezifikation fuer die Objekt- und Klassen-methoden der Klassen der Toolbox
#

$METHOD_CONFIG = {
  :Kreis => {
  :sichtbar_machen => { :label => :sichtbar_machen },
  :unsichtbar_machen => { :label => :unsichtbar_machen },
  :nach_unten_bewegen => { :label => :nach_unten_bewegen},
  :horizontal_bewegen => { :label => :'horizontal_bewegen(...)' , :args => [ [:'anzahl_punkte', :Integer] ] },
  :vertikal_bewegen => { :label => :'vertikal_bewegen(...)' , :args => [ [:'anzahl_punkte', :Integer] ] },
  :langsam_vertikal_bewegen => { :label => :'langsam_vertikal_bewegen(...)' , :args => [ [:'entfernung', :Integer] ] },
  :langsam_horizontal_bewegen => { :label => :'langsam_horizontal_bewegen(...)' , :args => [ [:'entfernung', :Integer] ] },
  :bewegen => { :label => :'bewegen(...)' ,
  :args => [
  [:'x_delta', :Integer],
  [:'y_delta', :Integer],
  [:'wiederholungen', :Integer],
  [:'wiederholen_nach [ms]', :Integer],
  [:'starten_nach [ms]', :Integer]] },
  :farbe_aendern => { :label => 'farbe_aendern(...)', :args => [ [:'neue_farbe', :String] ]},
  :groesse_aendern => { :label => 'groesse_aendern(...)', :args => [ [:'neuer_radius', :Integer] ]},
  },
  :Kreis_class => {
  :new => { :label => :'new()' },
  }
}

$METHOD_CONFIG[ :Dreieck] = $METHOD_CONFIG[ :Kreis ].clone()
$METHOD_CONFIG[ :Dreieck][ :groesse_aendern ]  =
{ :label => 'groesse_aendern(...)',
  :args => [ [ :breite, :Integer], [ :hoehe, :Integer ] ]}
$METHOD_CONFIG[ :Dreieck_class] = $METHOD_CONFIG[ :Kreis_class ]

$METHOD_CONFIG[ :Rechteck] = $METHOD_CONFIG[ :Kreis ].clone()
$METHOD_CONFIG[ :Rechteck][ :groesse_aendern ]  =
{ :label => 'groesse_aendern(...)',
  :args => [ [ :breite, :Integer], [ :hoehe, :Integer ] ]}
$METHOD_CONFIG[ :Dreieck_class] = $METHOD_CONFIG[ :Kreis_class ]
$METHOD_CONFIG[ :Rechteck_class] =  $METHOD_CONFIG[ :Kreis_class ].clone()
