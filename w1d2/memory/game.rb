require_relative 'card.rb'
require_relative 'board.rb'

class Game
  attr_accessor :board

  def initialize(board)
    @board = Board.new
  end

  def play
    #welcome
    setup
    until board.won?
      board.render
      @pos = prompt
      make_guess(@pos)
      second_guess = prompt
      make_guess(second_guess)
      evaluate(@pos, second_guess)
      board.render
    end
    # conclude
  end

  def out_of_range?(guess)
    guess.each do |num|
      return true unless (0..3).cover?(num)
    end
    false
  end

  def evaluate(pos, pos2)
    if board[pos].face_value == board[pos2].face_value
      board[pos], board[pos2] = "-", "-"
    else
      board[pos].hide
      board[pos2].hide
    end
  end

  def make_guess(pos)
    board.reveal(pos)
    board.render
  end

  def prompt
    guess = nil

    while guess == nil
      print "Make a guess in the form of x, y: "
      guess = gets.chomp.split(", ").map(&:to_i)

      if out_of_range?(guess)
        puts "You're off the board."
        guess = nil
      elsif board[guess] == "-"
        puts "You already guessed that"
        guess = nil
      # elsif out_of_range?(guess)
      #   puts "You're off the board."
      #   guess = nil
      elsif guess == @pos
        puts "Guess a different card."
        guess = nil
      end
    end
    guess

  end

  def setup
    board.make_deck
    board.shuffle_deck!
    board.populate
  end
end


if __FILE__ == $PROGRAM_NAME
  new_board = Board.new
  new_game = Game.new(new_board)
  p new_game.out_of_range?([4, 4])
  new_game.play
end
