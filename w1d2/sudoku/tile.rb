require 'colorize'
# require 'colorized_string'

class Tile
  attr_accessor :given
  attr_reader :value

  def initialize(value, given = false)
    @value = value
    @given = given
  end

  def to_s
    given ? value.to_s.colorize(:light_blue) : value.to_s
  end
end

if __FILE__ == $PROGRAM_NAME
  new_tile = Tile.new(9, true)
  puts new_tile.to_s

end
