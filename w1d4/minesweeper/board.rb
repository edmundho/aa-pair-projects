require 'byebug'
require_relative "tile.rb"

class Board
  def initialize
    @board = Array.new(9) { Array.new(9) }
    @tiles = Array.new(81) { Tile.new(false) }
  end

  def populate
    @tiles[0..9].map! { |tile| Tile.new(true) }
    @tiles.shuffle!
    @board.each_with_index do |row, i|
      row.each_with_index do |square, column|
        tile = @tiles.first
        row[column] = @tiles.shift
        tile.position = [i , column]
        byebug
        tile.num_bombs = tile.neighbor_info(@board)
      end
    end
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col]
  end

  def reveal(pos)
    loser if @board[pos].bomb
    @board[pos].reveal
  end



  def loser
    puts "YOU FOUND A BOMB. LOSER."
    true
  end
end
