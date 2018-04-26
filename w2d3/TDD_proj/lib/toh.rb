class TowersOfHanoi
  attr_reader :board
  def initialize(board = [[1, 2, 3], [], []])
    @board = board
  end

  def move
    disc_from = get_input("from")
    disc_to = get_input("to")
    update_board(disc_from, disc_to) if valid_move?(disc_from, disc_to)
    p @board
  end

  def play
    until won?
      move
    end

    conclude
  end

  def get_input(string)
    puts "#{string} (1, 2, 3):"
    input = gets.chomp.to_i - 1
  end

  def update_board(from, to)
    @board[to].unshift(@board[from].shift)
  end

  def valid_move?(from, to)
    return true if @board[to].empty?
    raise BadMoveError if @board[from].empty?
    @board[from].first < @board[to].first ? true : (raise BadMoveError)
  end

  def conclude
    puts "Fin"
  end

  def won?
    @board == [[], [], [1, 2, 3]] || @board == [[], [1, 2, 3], []]
  end
end

# ng = TowersOfHanoi.new
# ng.play
class BadMoveError < StandardError
end
