def matrix?(mat)
  # make sure matrix is an Array of rows 
  return false unless mat.is_a?(Array) && mat[0].is_a?(Array) 
  
  size = mat[0].size()
  
  # make sure all rows are Arrays and have same size
  (0...(mat.size - 1)).all? {|z| mat[z].is_a?(Array) && mat[z].size == size }  
end

def gewichtet(mat)
  # calculate sizes of mat
  zeile = mat.size
  spalte = mat[0].size

  ergebnis = Array.new(zeile){Array.new(spalte,0)}

  (0...zeile).each {|i|
    (0...spalte).each {|j|
      for nb_i in (-1..1) # Korridor für die Zeilen
        for nb_j in (-1..1) # Korridor für die Spalten
#          puts "#{(i)%mat.size()}, #{(j)%mat[0].size()}"
#          puts "#{(i+nb_i)%mat.size()}, #{(j+nb_j)%mat[0].size()}"
          ergebnis[i][j] +=  mat[(i+nb_i)%mat.size()][(j+nb_j)%mat[0].size()]
        end
      end
      ergebnis[i][j] /= 9.0
    }
  }
  ergebnis
end

# gegeben
def pp_mat(mat)
  mat.each { |zeile|
    zeile.each { |wert|
      printf('%3f ', wert)
    }
    puts
  }
  puts
end

puts matrix?(Array.new) # false
puts matrix?(Array.new(4){|zeile| Array.new(zeile +1)}) # false
puts matrix?(Array.new(4,17)) # false
puts matrix?([[1]]) # true
puts matrix?([[]]) # true
puts matrix?(Array.new(4){Array.new(3,1)}) # true

zeilen_laenge = 10
spalten_laenge = 6

puts -1%zeilen_laenge
puts 11%zeilen_laenge

#
### Ergebnisse fuer gewichtet
# 

orig0 = Array.new(4){Array.new(3,1)}
pp_mat(orig0)
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000
pp_mat(gewichtet(orig0))
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000

orig1 = Array.new(4){|zeile| Array.new(3,zeile+1)}
pp_mat(orig1)
#1.000000 1.000000 1.000000
#2.000000 2.000000 2.000000
#3.000000 3.000000 3.000000
#4.000000 4.000000 4.000000

pp_mat gewichtet(orig1)
#2.333333 2.333333 2.333333
#2.000000 2.000000 2.000000
#3.000000 3.000000 3.000000
#2.666667 2.666667 2.666667

orig2 = Array.new(4){|zeile| Array.new(3) {|spalte| zeile +spalte +1}}
pp_mat(orig2)
#1.000000 2.000000 3.000000
#2.000000 3.000000 4.000000
#3.000000 4.000000 5.000000
#4.000000 5.000000 6.000000

pp_mat(gewichtet(orig2))
#3.333333 3.333333 3.333333
#3.000000 3.000000 3.000000
#4.000000 4.000000 4.000000
#3.666667 3.666667 3.666667

orig3 = Array.new(7){|zeile| Array.new(5) {|spalte| zeile +spalte +1}}
pp_mat(orig3)
#1.000000 2.000000 3.000000 4.000000 5.000000 
#2.000000 3.000000 4.000000 5.000000 6.000000 
#3.000000 4.000000 5.000000 6.000000 7.000000 
#4.000000 5.000000 6.000000 7.000000 8.000000 
#5.000000 6.000000 7.000000 8.000000 9.000000 
#6.000000 7.000000 8.000000 9.000000 10.000000 
#7.000000 8.000000 9.000000 10.000000 11.000000
pp_mat(gewichtet(orig3))
#5.000000 4.333333 5.333333 6.333333 5.666667 
#3.666667 3.000000 4.000000 5.000000 4.333333 
#4.666667 4.000000 5.000000 6.000000 5.333333 
#5.666667 5.000000 6.000000 7.000000 6.333333 
#6.666667 6.000000 7.000000 8.000000 7.333333 
#7.666667 7.000000 8.000000 9.000000 8.333333 
#6.333333 5.666667 6.666667 7.666667 7.000000 


