require 'colorize'
require_relative 'cursor'
require_relative 'board'



class Display

attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0],board)
  end

  def render

    system("clear")

    cursor_at = cursor.cursor_pos
    puts "-------------------------------------------------"
    board.grid.each_with_index do |row, row_idx|
      b_row = row.map.with_index do |el, col_idx|
        if row_idx == cursor_at[0] && col_idx == cursor_at[1]
          el.to_s.colorize(:background => :green)
        else
          el.to_s
        end
      end.join("  |  ")
      puts "|  #{b_row}  |"
      puts "-------------------------------------------------"
    end
      # p "---------------------------------------------"
    nil
  end
end



if __FILE__ == $0
  b = Board.new
  c = Display.new(b)
  loop do
    c.render
    c.cursor.get_input
  end


end
