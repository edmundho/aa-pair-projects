require_relative 'tile.rb'

class Board
  attr_accessor :grid, :tile_grid

  def initialize(grid)
    @grid = grid
    @tile_grid = filled_grid(grid)
  end

  def filled_grid(grid)
    filled_grid = []
    grid.each do |row|
      sub_grid = []
      row.chars[0...-1].each do |el|
        if el.to_i != 0
          new_tile = Tile.new(el.to_i, true)
          sub_grid << new_tile
        else
          sub_grid << Tile.new(el.to_i)
        end
      end
      filled_grid << sub_grid
    end
    filled_grid
  end

  def self.from_file(file_name)
    Board.new(File.readlines(file_name))
  end

  def render
    puts "-----------------------------------------"
     tile_grid.each do |row|
       puts "| " + row.join(" | ") + " |"
       puts "-----------------------------------------"
    end
  end

  def solved?
    valid_rows? && valid_cols? && valid_squares?
  end

  def valid_rows?
    tile_grid.each do |row|
      return false if row.uniq != row
    end
    true
  end

  def valid_cols?
    tile_grid.transpose.each do |col|
      return false if col.uniq != col
    end
    true
  end

end

if $PROGRAM_NAME == __FILE__
  board = Board.from_file("sudoku1.txt")

  # puts File.readlines("sudoku1.txt")

  puts "-------------------------------------"
  board.tile_grid.each do |row|
   puts "| " + row.join(" | ") + " |"
   puts "-------------------------------------"
  end
end
