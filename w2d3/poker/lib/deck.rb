require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
  end

  def populate
    suits = ["hearts", "spades", "diamonds", "clubs"]

    (2..14).each do |value|
      suits.each do |suit|
        cards << Card.new(value, suit)
      end
    end
  end

  def deal_card
    cards.pop
  end
  
  def shuffle
    cards.shuffle!
  end
end
