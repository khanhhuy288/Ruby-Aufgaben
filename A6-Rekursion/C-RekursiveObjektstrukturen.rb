require 'Set'

class Set
  def to_s
    # return empty Set when Set's size equal 0
    return 'Set {}' if size == 0

    # map elements from Set to an array
    set = "Set {#{self.map{|x| x }}}"

    # delete square brackets
    set.delete('[]')
  end
end

def deep_collect_keys(a_hash)
  raise ArgumentError, 'Der Parameter ist vom falschem Typ' unless a_hash.is_a? Hash

  result = Set.new
  a_hash.each { |k, v|
    result << k
    result.merge(deep_collect_keys(k)) if k.is_a? Hash
    result.merge(deep_collect_keys(v)) if v.is_a? Hash
  }
  result
end

def deep_to_a(a_hash)
  raise ArgumentError, 'Der Parameter ist vom falschem Typ' unless a_hash.is_a?(Hash) # || a_hash.is_a?(Numeric)
  deep_to_a_intern(a_hash)
end

def deep_to_a_intern(a_hash)
  # base case
  return a_hash unless a_hash.is_a? Hash

  # general case
  a_hash.map { |k, v|
    [deep_to_a_intern(k), deep_to_a_intern(v)]
  }
end

def deep_ary_plus_depth(ary, depth = 0)
  raise ArgumentError, 'Der Parameter ist vom falschem Typ' unless ary.is_a? Array
  
    
  # add the biggest array and its depth = 0 
  #result << depth << ary if depth == 0 

  result = [depth,ary]
  ary.each { |elem|
    if elem.is_a? Array
      #depth += 1
      #result << depth+1 << elem
      result += deep_ary_plus_depth(elem, depth+1)
      #depth -= 1
    end
  }
  result
end

def deep_to_string(ary)
  # base case 
  return ary unless ary.is_a? Array
  
  # general case 
  '[' + ary.map { |elem| deep_to_string(elem) }.join(', ') + ']'
end


puts 'deep_collect_keys(a_hash)'
h = {{2=>4} => {4 => {{5 => {1 => 3, 2=> 4}} => {7 => 8}}}}
puts "#{deep_collect_keys(h)}"                # {{2=>4},2,4,{5=>{1=>3, 2=>4}},5,1,7}


puts 'deep_to_a(a_hash)'
puts "#{deep_to_a(h)}"            # [[[[2, 4]], [[4, [[[[5, [[1, 3], [2, 4]]]], [[7, 8]]]]]]]]
puts "#{deep_to_a({1=>2, 2=>3})}"                   # [[1, 2], [2, 3]]
puts "#{deep_to_a({1=>2, 2=>3, {3=>4, 5=>6}=>7})}"  # [[1, 2], [2, 3], [[[3, 4], [5, 6]], 7]]
puts "#{deep_to_a({{5=>{1=>3, 2=>4}}=>{7=>8}})}"    # [[[[5, [[1, 3], [2, 4]]]], [[7, 8]]]]
puts "#{deep_to_a({5=>{1=>3, 2=>4}})}"              # [[5, [[1, 3], [2, 4]]]]


puts 'deep_ary_plus_depth(ary, depth = 0)'
ary = [1,[9,22,[5,7,0],8],2,[11,[[[44]]],0],3]
puts "#{deep_ary_plus_depth(ary)}"
# [ 0, [1, [9, 22, [5, 7, 0], 8], 2, [11, [[[44]]], 0], 3],
#   1, [9, 22, [5, 7, 0], 8],
#   2, [5, 7, 0],
#   1, [11, [[[44]]], 0],
#   2, [[[44]]],
#   3, [[44]],
#   4, [44] ]


puts 'deep_to_string(ary)'
class Kreis
  def initialize(x, y, radius)
    @x = x
    @y = y
    @radius = radius
  end

  def to_s
    "K[mp=(#@x,#@y),r=#@radius]"
  end
end

ary3 = [[[1,2,3, Kreis.new(1,2,4)]],[4,5,6,7], Kreis.new(1,2,33),2,3,8 ]
puts "#{deep_to_string(ary3)}"    # [[[1,2,3,K[mp=(1,2),r=4]]],[4,5,6,7],K[mp=(1,2),r=33],2,3,8]


