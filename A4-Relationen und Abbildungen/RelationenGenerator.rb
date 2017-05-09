require './Relation'

class RelationenGenerator
  def RelationenGenerator.generiere_relation(set_a,set_b,k)
    # create new Relations from 2 Sets
    relation = Relation.new(set_a, set_b)

    # return empty Relation if k is not valid (k > max_tupels)
    max_tupels = set_a.size * set_b.size
    if k > max_tupels
      puts 'k muss <= maximale Anzahl der Tupels sein.'
      return relation
    end

    # add k Tupels to Relation
    while relation.size < k
      # get 1 random element from each Set to make a Tupel
      relation.add(Tupel.new(set_a.to_a[rand(set_a.size)], set_b.to_a[rand(set_b.size)]))
    end

    return relation
  end

  def RelationenGenerator.generiere_abbildung(set_a,set_b)
    # create new function from 2 Sets
    relation = Relation.new(set_a, set_b)

    # Abbildung: von jedem a muss genau ein Pfeil ausgehen, also linksvollständig und rechtseindeutig
    set_a.each { |a|
      relation.add(Tupel.new(a, set_b.to_a[rand(set_b.size)]))
    }

    return relation
  end

end


set_a = Set.new([4, 7, 8, 4])
set_b = Set.new([5, 7, 8, 9])
set_c = Set.new([4, 7, 8])
set_d = Set.new([1])
set_e = Set.new([4])

#
# puts set_a
# puts set_a == set_c

# my_tupel1 = Tupel.new(4,8)
# my_tupel2 = Tupel.new(9,7)
# my_tupel3 = Tupel.new(7,7)
# my_tupel4 = Tupel.new(4,8)
# my_tupel5 = Tupel.new(4,8)

# my_relation = Relation.new(set_a, set_b)
# my_relation.add(my_tupel1)
# my_relation.add(my_tupel2)
# my_relation.add(my_tupel3)
# my_relation.add(my_tupel4)
# my_relation.add(my_tupel5)

# puts my_relation
# puts set_a.size

new_relation = RelationenGenerator.generiere_relation(set_b, set_b, 4)

puts new_relation




