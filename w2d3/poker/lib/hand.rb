require 'byebug'

class Hand
  attr_reader :cards
  def initialize(deck)
    @cards = []
    5.times { @cards << deck.deal_card }
  end

  def royal_flush?
    p "hello"
    return false if cards.any? { |card| card.suit != cards[0].suit }

    card_values = []
    self.cards.each { |card| card_values << card.value }
    card_values.sort == [10, 11, 12, 13, 14]
  end

end
