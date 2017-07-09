require_relative "A3Kasse"

class KasseLeser
  # TODO nach Aufgabenstellung
  def self.lese_kasse_von(datei)
    kasse = Kasse.new

    File.open(datei, 'r').each_line { |line|
      if line.strip.squeeze(' ').empty?
        puts 'Leerzeile überlesen'
      else
        # create array with Rechnung's number and positions
        rechnung_arr = line.strip.squeeze(' ').split('||')

        # create a new Rechnung
        rechnung = Rechnung.new(42)
        (1...rechnung_arr.size).each { |i|
          # create array with Position's preis and produkt
          position_arr = rechnung_arr[i].split(';')

          produkt = position_arr[0].strip
          preis = Integer(position_arr[1])

          # create new Position in Rechnung
          position = Position.new(produkt,preis)
          rechnung << position
        }

        # add new Rechnung to Kasse
        kasse << rechnung
      end
    }
  end
end

KasseLeser.lese_kasse_von('a4/rechnungen.sv')