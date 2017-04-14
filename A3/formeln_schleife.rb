def fak(n)
  # make sure n is valid
  return 'n muss eine Integer >= 0 sein' if n < 0 || !n.integer?

  result = 1
  2.upto(n) { |i| result *= i }
  result
end

def ln(x, n)
  # make sure x, n is valid
  return 'x muss > 0 sein' if x <= 0
  return 'n muss eine Integer >= 0 sein' if n < 0 || !n.integer?

  # convert x to float
  x = x.to_f
  result = 0
  1.upto(n) { |i| result += (x - 1)**i / (i * x**i) }
  result
end

def f(a, x, n)
  # make sure a, n is valid
  return 'a muss > 0 sein' if x <= 0
  return 'n muss eine Integer >= 0 sein' if n < 0 || !n.integer?

  # convert a, x to float
  a = a.to_f
  x = x.to_f

  result = 0
  0.upto(n) { |i| result += Math.log(a)**i / fak(i) * x**i }
  result
end









