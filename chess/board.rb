require_relative 'piece'

class Board

  attr_reader :grid

  def initialize
    wboard = Array.new(2) {Array.new(8) {Piece.new}}
    nboard = Array.new(4) {Array.new(8) {NullPiece.new}}
    bboard = Array.new(2) {Array.new(8) {Piece.new}}
    @grid = wboard + nboard + bboard
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    grid[row][col] = piece
  end

  def move_piece(start_pos,end_pos)
    raise NoPieceError if self[start_pos].class == NullPiece
    raise BadMoveError unless self[end_pos].class == NullPiece
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

class NoPieceError < Exception
  def message
    "There is no piece at start_pos"
  end
end

class BadMoveError < Exception
  def message
    "end_pos isn't empty"
  end
end

end
