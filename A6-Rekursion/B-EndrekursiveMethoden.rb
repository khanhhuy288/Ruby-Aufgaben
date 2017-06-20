def geo_reihe(x, n, accu = 1)
  # make sure x, n are valid
  raise ArgumentError, 'Die Parameter sind vom falschem Typ' unless x.is_a?(Numeric) && n.is_a?(Integer)
  raise ArgumentError, 'Die Parameter liegen nicht im zulässigen Wertebereich' if x.abs >= 1 || n < 0

  return accu if n == 0                  # base case
  geo_reihe(x, n - 1, accu + x ** n)     # general case
end

def reverse_rek(ary, accu = [])
  raise ArgumentError, 'Der Parameter ist vom falschem Typ' unless ary.is_a? Array
  
  return accu if ary.empty?                         # base case   
  reverse_rek(ary.drop(1), ary.first(1) + accu)     # general case      
end

puts geo_reihe(0.6,8)

ary = [1,[1,22,[5,7,0],8],2,3]
print "#{reverse_rek(ary)} \n"          # [3, 2, [1, 22, [5, 7, 0], 8], 1]

#my_ary = [1, 2, 3, 4]
#my_ary.drop(1)
#print my_ary

