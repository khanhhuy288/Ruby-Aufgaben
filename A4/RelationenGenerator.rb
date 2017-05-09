require './Relation'
require './Tupel'

class RelationenGenerator
  def RelationenGenerator.generiere_relation(set_a,set_b,k)
    # create new relation from 2 sets
    relation = Relation.new(set_a, set_b)

    # add k pairs to relation
    while relation.length < k
      # get 1 random element from each set to make a pair
      relation.add(Tupel.new(set_a.to_a[rand(set_a.length)], set_b.to_a[rand(set_b.length)]))
    end

    return relation
  end

  def RelationenGenerator.generiere_abbildung(set_a,set_b)
    # create new function from 2 sets
    relation = Relation.new(set_a, set_b)

    # Abbildung: von jedem a muss genau ein Pfeil ausgehen, also linksvollständig und rechtseindeutig
    set_a.each { |a|
      relation.add(Tupel.new(a, set_b.to_a[rand(set_b.length)]))
    }

    return relation
  end

end


set_a = Set.new([5, 6, 2, 9])
set_b = Set.new([5, 6, 2, 9])
puts set_a == set_b