require "tk"
require "Turtle"
require "Point"

class RekursiverBaum
  
  # Konstanten für die unterschiedlichen Baumtypen
  BAUM1 = 1
  BAUM2 = 2
  BAUM3 = 3
  BAUM1_LAENGE = 100
  BAUM2_LAENGE = 100
  BAUM3_LAENGE = 50
  BAUM1_BREITE = 1
  BAUM2_BREITE = BAUM1_BREITE
  BAUM3_BREITE = BAUM1_BREITE
  BAUM1_WINKEL = 24.8
  BAUM2_WINKEL = 25.7
  BAUM3_WINKEL = 22.5
  
  
  def initialize()
    @factor = 2.0 # Faktor, um den in jedem Schritt die Länge der Strecke gekürzt wird.
  end
  
  
  def zeichnen(typ,wiederholungen,x,y) 
    @turtle = Turtle.new(x,y,90)  # Zeichenwerkzeug
    case typ
    when BAUM1
      baum_1(wiederholungen, BAUM1_WINKEL,BAUM1_LAENGE, BAUM1_BREITE)
    when BAUM2
      baum_2(wiederholungen, BAUM2_WINKEL, BAUM2_LAENGE, BAUM2_BREITE)
    when BAUM3
      baum_3(wiederholungen, BAUM3_WINKEL, BAUM3_LAENGE, BAUM3_BREITE)
    else
      puts "Typ nicht bekannt"
    end
  end

  def loeschen()
    @turtle.loeschen()
  end

  
  # P =  {X -> F[+X]F[-X]+X}
  def baum_1(n,winkel,laenge,breite = BAUM1_BREITE)
    # Abbruchbedingung
    if n == 0
      return
    end
    
    # Rekursiver Aufruf X -> F[+X]F[-X]+X
    @turtle.go_ahead(laenge)                            # F
    @turtle.remember                                    # [
    @turtle.turn_left(BAUM1_WINKEL)                     # +
    baum_1(n-1, BAUM1_WINKEL, (laenge / @factor).round) # X
    @turtle.restore                                     # ]
    @turtle.go_ahead(laenge)                            # F
    @turtle.remember                                    # [
    @turtle.turn_right(BAUM1_WINKEL)                    # -
    baum_1(n-1, BAUM1_WINKEL, (laenge / @factor).round) # X
    @turtle.restore                                     # ]
    @turtle.turn_left(BAUM1_WINKEL)                     # +
    baum_1(n-1, BAUM1_WINKEL, (laenge / @factor).round) # X
  end
  
  # P = {X-> F[+X][-X]FX}
  def baum_2(n,winkel,laenge, breite = BAUM2_BREITE)
    # Abbruchbedingung
    if n == 0
      return
    end
    
    # Rekursiver Aufruf X-> F[+X][-X]FX
    @turtle.go_ahead(laenge)                            # F
    @turtle.remember                                    # [
    @turtle.turn_left(BAUM2_WINKEL)                     # +
    baum_2(n-1, BAUM2_WINKEL, (laenge / @factor).round) # X
    @turtle.restore                                     # ] 
    @turtle.remember                                    # [
    @turtle.turn_right(BAUM2_WINKEL)                    # -
    baum_2(n-1, BAUM2_WINKEL, (laenge / @factor).round) # X
    @turtle.restore                                     # ]
    @turtle.go_ahead(laenge)                            # F
    baum_2(n-1, BAUM2_WINKEL, (laenge / @factor).round) # X
  end
  
  # P = {X -> F-[[X]+X]+F+[+FX]-X}
  def baum_3(n,winkel,laenge,breite = BAUM3_BREITE)
    # Abbruchbedingung
    if n == 0
      return
    end
    
    # Rekursiver Aufruf X -> F-[[X]+X]+F+[+FX]-X
    @turtle.go_ahead(laenge)                            # F
    @turtle.turn_right(BAUM3_WINKEL)                    # -
    @turtle.remember                                    # [
    @turtle.remember                                    # [
    baum_3(n-1, BAUM3_WINKEL, (laenge / @factor).round) # X
    @turtle.restore                                     # ]
    @turtle.turn_left(BAUM3_WINKEL)                     # +
    baum_3(n-1, BAUM3_WINKEL, (laenge / @factor).round) # X
    @turtle.restore                                     # ]
    @turtle.turn_left(BAUM3_WINKEL)                     # +
    @turtle.go_ahead(laenge)                            # F
    @turtle.turn_left(BAUM3_WINKEL)                     # +
    @turtle.remember                                    # [
    @turtle.turn_left(BAUM3_WINKEL)                     # +
    @turtle.go_ahead(laenge)                            # F
    baum_3(n-1, BAUM3_WINKEL, (laenge / @factor).round) # X
    @turtle.restore                                     # ]
    @turtle.turn_right(BAUM3_WINKEL)                    # -
    baum_3(n-1, BAUM3_WINKEL, (laenge / @factor).round) # X
  end
  
end