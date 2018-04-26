require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "initializes an empty array for deck" do
      expect(deck.cards).to be_empty
    end
  end

  describe "#populate" do
    it "populates deck with 52 card objects" do
      deck.populate
      expect(deck.cards.length).to eq(52)
      expect(deck.cards[0].class).to be(Card)
    end
  end

  describe "#shuffle" do
    it "shuffles the deck" do
      deck.populate
      expect{ deck.shuffle }.to change { deck.cards }
      deck.shuffle
      expect(deck.cards.length).to eq(52)
    end
  end
end
