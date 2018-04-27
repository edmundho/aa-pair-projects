require_relative 'card.rb'

class Board
  attr_accessor :grid
  attr_reader :deck


  def initialize
    @grid = Array.new(4) { Array.new(4) }
  end

  # private

  def make_deck
    number_of_cards = grid.flatten.size / 2
    @deck = []
    number_of_cards.times do |i|
      @deck << Card.new(i + 1)
    end
    # @deck *= 2
    number_of_cards.times do |i|
      @deck << Card.new(i + 1)
    end
    @deck
  end

  def shuffle_deck!
    @deck.shuffle!
  end

  def [](pos)
    row, col = pos
    # puts "row is:#{row}, col is: #{col}"
    @grid[row][col]
  end

  def []=(pos, card)
    row, col = pos
    @grid[row][col] = card
  end

  def populate
    grid.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        grid[row_idx][col_idx] = @deck.pop
      end
    end
  end

  def render
    # system('clear')
    display_board = []
    grid.each do |row|
      display_board << render_row(row)
    end
    puts "\n"
    display_board.each do |row|
      puts "-------------"
      puts row.join("   ")
    end
    puts "-------------"
    # sleep(3)
  end

  def render_row(row)
    rendered_row = []
    row.each do |el|
      if el.class == String
        rendered_row << el
      elsif el.face_up == false
        rendered_row << "X"
      else
        rendered_row << el.face_value.to_s
      end
    end
    rendered_row
  end

  def won?
    grid.flatten.all? { |el| el == "-" }
  end

  def reveal(guessed_pos)
    if self[guessed_pos].is_a?(String)
      puts "You already guessed this."
    else
      self[guessed_pos].reveal
    end
  end
end



if __FILE__ == $PROGRAM_NAME

  new_board = Board.new
  new_board.make_deck
  new_board.deck.map { |card| puts card.object_id }.sort
  # new_board.shuffle_deck!
  # new_board.populate
  # p new_board.grid
  # new_board.render
end
