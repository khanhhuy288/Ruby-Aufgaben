def gewuerfelt?(zahl, von, bis)
  rand(von..bis) == zahl
end

def gewinner_nummer(zahl, folge)
  player_num = 1
  flag = true
  while flag
    erfolg = 0
    folge.times {
      # stop checking if failed
      if gewuerfelt?(zahl, 1, 6)
        erfolg += 1
      end
    }
    # declare winner
    if erfolg == folge
      flag = false
    else
      # test next player
      player_num += 1
    end
  end
  player_num
end

puts "The winner is player ##{gewinner_nummer(4, 3)}"
puts "The winner is player ##{gewinner_nummer(4, 5)}"
puts "The winner is player ##{gewinner_nummer(4, 10)}"

