require 'card'
describe Card do
  subject(:card) { Card.new(9, "spades")}
# let (:values) { [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]}
  describe "#initialize" do
    it "initializes card with value and suit" do
      expect(card.value).to eq(9)
      expect(card.suit).to eq("spades")
    end
  end

  describe "#symbol" do
    let(:queen) { Card.new(12, "hearts") }
    it "symbolized cards" do
      expect(queen.symbol.class).to be(String)
      expect(queen.symbol).to eq("Q")
      expect(card.symbol).to eq("9")
    end

  end
end
