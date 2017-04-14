def gewuerfelt?(zahl, von, bis)
  rand(von..bis) == zahl
end

def gewinner_nummer(zahl, folge)
  player_num = 1
  while true
    folge.times {
      return player_num if gewuerfelt?(zahl, 1, 6)
    }
    player_num += 1
  end
end

puts "The winner is player ##{gewinner_nummer(4, 2)}"


