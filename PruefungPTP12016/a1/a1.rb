#TODO Naeherung fuer Math.log(x) fuer x > 0.5 iterativ (5Pkt)

def ln_i(x,n)
  raise ArgumentError, 'Die Parameter sind vom falschem Typ' if !x.is_a?(Numeric) || !n.is_a?(Integer)
  raise ArgumentError, 'Die Parameter liegen nicht im zulässigen Wertebereich' if x <= 0.5 || n < 1

  result = 0
  1.upto(n) { |i|
    result += (x-1.0)**i / (i*x**i)
  }
  result
end

#TODO Naeherung fuer Math.log(x) fuer x > 0.5 rekursiv (5Pkt)

def ln_r(x,n)
  raise ArgumentError, 'Die Parameter sind vom falschem Typ' if !x.is_a?(Numeric) || !n.is_a?(Integer)
  raise ArgumentError, 'Die Parameter liegen nicht im zulässigen Wertebereich' if x <= 0.5 || n < 1

  # base case
  return (x-1.0)**1 / (1*x**1) if n == 1

  # general case
  ln_r(x, n - 1) + (x-1.0)**n / (n*x**n)
end

# TODO Methode deep_group_by_class fuer Arrays 1Pkt
# 10 Pkt
class Array
  def deep_group_by_class
    @@result = {}
    deep_group_by_class_intern(self)
    @@result
  end

  private

  def deep_group_by_class_intern(ary)
    ary.each { |elem|
      type = elem.class
      @@result[type] = [] if !@@result.has_key?(type)
      @@result[type] << elem

      deep_group_by_class_intern(elem) if elem.is_a?(Array)
    }
    
  end
end

# 10 Pkt  // 8 Pkt fuer korrekte Loesung mit each
# TODO Methode multi_value_reverse auf Hash
def multi_value_reverse(a_hash)
  raise ArgumentError, 'Parameter ist kein Hash' if !a_hash.is_a?(Hash) 
  
  result = {}
  a_hash.each { |key, val|
    val.each { |v|
      result[v] = [] if !result.has_key?(v)
      result[v] << key
    }
  }
  result
end

multi_value_hash = {
  :best1 => [:thetas, :myo, :hololens],
  :best2 => [:gear_360, :soli, :vive] ,
  :best3 => [:thetas, :gear_360, :myo] }

print multi_value_reverse(multi_value_hash)

