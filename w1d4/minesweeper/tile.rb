require 'byebug'

class Tile
  attr_accessor :position, :num_bombs

  def initialize(boolean)
    @bomb = boolean
    @position = []
    @revealed = false
    @num_bombs = 0
  end

  def neighbor_info(board)
    byebug
    x, y = position
    bomb_count = 0

    (x - 1..x + 1).each do |i|
      (y - 1..y + 1).each do |j|
        next if i == x && j == y
        if board[i][j].bomb && i > 0 && j > 0
          bomb_count += 1
        end
      end
    end

    bomb_count
  end

  # def in_bound?()

  def reveal
    @revealed = true
  end

end
