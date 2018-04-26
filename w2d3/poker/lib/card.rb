class Card
attr_reader :value, :suit
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def symbol
    symbols = %w(J Q K A)
    self.value > 10 ? "#{symbols[self.value - 11]}" : "#{self.value}"
  end

end
