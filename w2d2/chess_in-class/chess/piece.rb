require 'Singleton'
require 'colorize'
require_relative 'modules'

class Piece
  attr_reader :color, :pos

  def initialize(color,pos)
    @color = color
    @pos = pos

  end

  def pos=(val) # new position when piece is moved

  end

  def valid_moves

  end

  def to_s
    color == :w ? "♕" : "♛"
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
    super(:g, [0, 0])
  end

  def to_s
    " "
  end

end
#
#
class Rook < Piece
  include SlidingPiece
  def initialize(color, pos)
    super(color, pos)
  end

  def to_s
    color == :w ? "♖" : "♜"
  end

  def move_dirs
    [horizontal_dirs]
  end
end
#
#
class Bishop < Piece
  include SlidingPiece

  def initialize(color, pos)
    super(color, pos)
  end

  def to_s
    color == :w ? "♗" : "♝"
  end

  def move_dirs
    [diagonal_dirs]
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(color, pos)
    super(color, pos)
  end

  def to_s
    color == :w ? "♕" : "♛"
  end

  def move_dirs
    [diagonal_dirs, horizontal_dirs]
  end
end
#
#
# class Pawn < Piece
# # include module_slidable
#
#
# end
