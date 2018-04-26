require 'hand'
require 'byebug'
require 'deck'


describe Hand do
  subject(:hand) { Hand.new(deck) }
  let(:deck) { Deck.new }
  before(:each) do
    deck.populate
    # deck.shuffle
  end
  describe "#initialize" do

    it "initializes with 5 cards" do
      allow(deck).to receive(:deal_card).and_return(1)
      expect(hand.cards).to eq([1, 1, 1, 1, 1])
      expect(hand.cards.length).to eq(5)
      expect(hand.cards.class).to be(Array)
    end
  end

  describe "#royal_flush" do
    let(:a) {double("a", value:14, suit:"hearts")}
    let(:k) {double("k", value:13, suit:"hearts")}
    let(:q) {double("q", value:12, suit:"hearts")}
    let(:j) {double("j", value:11, suit:"hearts")}
    let(:ten) {double("ten", value:10, suit:"hearts")}
    let(:deck) { [a, k, q, j, ten] }
    # let(:royal) { double("royal", cards: [a, k, q, j, ten])}
    let(:royal) { Hand.new(deck) }
    it "checks if hand is royal flush" do
      # byebug
      allow(royal).to receive(:royal_flush?)
      allow(royal).to receive(:deal_card).and_return()
      p royal.cards[0].value
      expect(royal.royal_flush?).to be true
    end
  end

  describe "#royal_flush" do
    it "checks for royal flush" do

      p deck.cards
    end

  end
end
