require 'toh'

RSpec.describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  describe "#initialize" do
    it "initializes board" do
      expect(game.board.length).to eq(3)
    end

    it "makes first pile of discs" do
      expect(game.board[0].length).to eq(3)
    end
  end

  describe "#update_board" do
    it "updates the board" do
      expect{ game.update_board(0, 1) }.to change { game.board.first }
    end

    # let(:game) { double: "dummy game", board: [[1, 2, 3], [], []] }
    # it "calls unshift" do
    #   allow(game).to receive(update_board(0, 1)).and_return([[2, 3], [1], []])
    #
    #   # expect(game.board).to receive(:unshift)#.with(game.board[0][0])
    #   expect(game.update_board(0, 1)).to receive(:unshift)
    #   game.update_board(0, 1)
    # end
  end

  describe "#won?" do
    let(:game) { TowersOfHanoi.new([[], [1, 2, 3], []])}
    it "checks if the game is won" do
      expect(game).to be_won
    end
  end

  describe "#valid_move?" do
    it "returns true if move is valid" do
      expect(game.valid_move?(0, 1)).to be true
    end

    it "raises an error if move not valid" do
      expect { game.valid_move?(2, 0) }.to raise_error(BadMoveError)
    end


    it "raises an error if larger disc goes on smaller disc" do
      game.update_board(0, 1)
      game.update_board(0, 2)
      expect { game.valid_move?(2, 1) }.to raise_error(BadMoveError)
    end
  end




end
