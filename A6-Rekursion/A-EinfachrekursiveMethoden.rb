def geo_reihe(x, n)
  # make sure x, n are valid
  unless x.is_a?(Numeric) && n.is_a?(Integer)
    raise ArgumentError, 'Die Parameter sind vom falschem Typ'
  end

  if x.abs >= 1 || n < 0
    raise ArgumentError, 'Die Parameter liegen nicht im zulässigen Wertebereich'
  end

  return 1 if n == 0              # terminate recursion
  geo_reihe(x, n - 1) + x ** n    # do recursion
end

def reverse_rek(ary)
  raise ArgumentError, 'Der Parameter ist vom falschem Typ' unless ary.is_a?(Array)
  
  return ary if ary.size == 1               # terminate recursion  
  reverse_rek(ary.drop(1)) + ary.first(1)   # do recusion      
end

def deep_reverse(ary)
  raise ArgumentError, 'Der Parameter ist vom falschem Typ' unless ary.is_a?(Array)
   
  result = []
  ary.each { |elem|
    if elem.is_a?(Array) 
      result << deep_reverse(elem)
    else 
      result << elem
    end
  }
  return result.reverse
end

puts geo_reihe(0.6,8)

ary = [1,[1,22,[5,7,0],8],2,3]
print "#{reverse_rek(ary)} \n"          # [3, 2, [1, 22, [5, 7, 0], 8], 1]
print "#{deep_reverse(ary)} \n"          # [3, 2, [8, [0, 7, 5], 22, 1], 1]

#my_ary = [1, 2, 3, 4]
#my_ary.drop(1)
#print my_ary









