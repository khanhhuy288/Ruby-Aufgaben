require_relative 'Kasse'

class KasseLeser
  def self.lese_kasse_von(datei_name)
    # create empty Kasse
    kasse = Kasse.new

    # show file in console without extraneous whitespaces and blank lines
    File.open('a5_2/rechnungen.sv', 'r').each_line { |line|
      if !line.chomp.empty?
        puts line.strip.squeeze(' ')
      end
    }

    File.open('a5_2/rechnungen.sv', 'r').each_line { |line|
      # read valid line 
      if !line.chomp.empty?
        # create array with Rechnung's number and positions
        rechnung_arr = line.strip.squeeze(' ').split('||')
        
        # create a new Rechnung 
        rechnung = Rechnung.new(rechnung_arr[0].to_i)
        (1...rechnung_arr.size).each { |i|
          # create array with Position's preis and produkt 
          position_arr = rechnung_arr[i].split(';')
          
          produkt = position_arr[0].strip
          preis = position_arr[1].to_i
          
          # create new Position in Rechnung 
          position = Position.new(produkt,preis)
          rechnung << position
        }
        
        # add new Rechnung to Kasse 
        kasse << rechnung
      end
    }

    #    position = Position.new("Gel Play", 7)
    #    rechnung = Rechnung.new(2) << position
    #    kasse = Kasse.new << rechnung

    return kasse
  end

end

print KasseLeser.lese_kasse_von("rechnungen.sv")
