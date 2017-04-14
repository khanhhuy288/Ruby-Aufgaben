# import functions
require './muster_ausgeben.rb'

puts 'Willkommen in der Musterfabrik'

while true
  # show instruction
  puts 'Geben Sie eine Zahl ein um ein Muster auszuwählen oder "exit" um das Programm zu beenden'
  puts '1:Kreuz'
  puts '2:Dreieck links'
  puts '3:Dreieck rechts'
  puts '4:gleichschenkliges Dreieck'

  # get input
  option = gets.chomp
  # remove spaces and lowercase input
  option = option.delete(' ')
  option.downcase!

  # check if input is valid
  if  !%w[1 2 3 4 exit].include?(option)
    puts 'ungültige Eingabe'

  # exit program
  elsif option == 'exit'
    puts 'Tschüss. Die Druckerei geht in die Osterferien'
    exit

  # draw patterns
  else
    # turn input to number
    option = option.to_i

    # get inputs
    puts 'Geben Sie eine ungerade Zahl für Zeilen/Spalten des Musters ein'
    num = gets.chomp.to_i
    puts 'Geben Sie ein Muster ein'
    pattern = gets.chomp

    # match patterns
    case option
      when 1
        kreuz(num, pattern)
      when 2
        dreieck1(num, pattern)
      when 3
        dreieck2(num, pattern)
      else
        dreieck3(num, pattern)
    end
  end

  puts # newline
end