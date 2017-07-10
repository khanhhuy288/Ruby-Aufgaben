# Gesamt 26 Pkt

# 8 Pkt
# Näherung von ln(x) berechnen für x > 0.5
def sum(x,n)
  #TODO
  raise ArgumentError, 'Ungültige Werte' if !x.is_a?(Numeric) || !n.is_a?(Integer) || x <= 0.5 || n < 1

  result = 0

  1.upto(n){ |i|
    result += (x - 1.0)**i / (i * x**i)
  }

  result
end

# 10 Pkt
class Array
  #TODO
  def rek_count_type(type)
    @@result = 0
    @@result += rek_count_type_intern(self, type)
    @@result
  end

  private

  def rek_count_type_intern(ary, type)
    result = 0
    ary.each { |elem|
      if elem.is_a?(type)
        result += 1
      end
      if elem.is_a?(Array)
        result += rek_count_type_intern(elem, type)
      end
    }
    result
  end

end

# 8 Pkt

def max_bestellwert(ein_hash)
  #TODO
  result = {}
  ein_hash.each { |key, val|
    result[key] = val.inject(0) { |sum, v| sum + v}
  }
  result.max { |a, b| a[1] <=> b[1] }[0]
end


