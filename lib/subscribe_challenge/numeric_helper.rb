class Numeric
  def percent_of(n)
    (self.to_f * n.to_f) / 100.0
  end

  def round_up(n=0.05)
    rate = (1.0 / n)
    rounded = (self * rate).round / rate
    rounded < self ? self : rounded 
  end
end
