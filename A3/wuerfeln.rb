def gewuerfelt?(zahl, von, bis)
  rand(von..bis) == zahl
end

def gewinner_nummer(zahl, folge)
  player_num = 1
  while true
    erfolg = 0
    folge.times {
      # stop checking if failed
      break unless gewuerfelt?(zahl, 1, 6)
      erfolg += 1
    }
    # declare winner
    return player_num if erfolg == folge

    # test next player
    player_num += 1
  end
end

puts "The winner is player ##{gewinner_nummer(4, 3)}"
puts "The winner is player ##{gewinner_nummer(4, 5)}"
puts "The winner is player ##{gewinner_nummer(4, 10)}"


