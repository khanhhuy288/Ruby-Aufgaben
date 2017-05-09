def dezimal_ziffer?(char)
  ('0'..'9').include?(char)
end

def oktal_ziffer?(char)
  ('0'..'7').include?(char)
end

def hexadezimal_ziffer?(char)
  ('0'..'9').include?(char) || ('A'..'F').include?(char)
end

def dezimal?(string)
  # make sure string doesn't begin with '0'
  return false if string[0] == '0'
  # make sure every char is decimal
  string.each_char {|c|
    return false unless dezimal_ziffer?(c)
  }
  # succeed
  true
end

def oktal?(string)
  # make sure string begins with '0'
  return false unless string[0] == '0'
  # make sure every char is octal
  string.each_char {|c|
    return false unless oktal_ziffer?(c)
  }
  # succeed
  true
end

def hexadezimal?(string)
  # make sure string begins with '0x'
  return false unless string[0..1] == '0x'
  # make sure remaining char is hexadecimal
  string[2..string.length-1].each_char {|c|
    return false unless hexadezimal_ziffer?(c.upcase)
  }
  # succeed
  true
end

def start_analysis
  puts 'Wir analysieren die Eingabe auf ganzzahlige Werte im Dezimal- / Oktal- und Hexadezimalsystem'
  while true
    puts 'Geben Sie eine Zahl in Dezimal- / Oktal- und Hexadezimaldarstellung ein'
    input = gets.chomp
    # remove leading/trailing spaces and upcase input
    command = input.strip.downcase
    if command == 'exit'
      puts 'Bis zum nächsten Mal'
      exit
    elsif dezimal?(input)
      puts "#{input} ist eine Zahl im Dezimalsystem"
    elsif oktal?(input)
      puts "#{input} ist eine Zahl im Oktalsystem"
    elsif hexadezimal?(input)
      puts "#{input} ist eine Zahl im Hexadezimalsystem"
    else
      puts "#{input} ist keine Zahl im Dezimal- / Oktal- oder Hexadezimalsystem"
    end
  end
end

start_analysis


