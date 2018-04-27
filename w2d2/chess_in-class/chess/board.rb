require 'byebug'
require_relative 'errors'
require_relative 'piece'
require_relative 'display'

class Board

  attr_reader :grid

  PIECES = {
    [0,0] => Rook
  }

  def initialize
    # wboard = Array.new(2) {Array.new(8) {Piece.new(:w)}}
    # nboard = Array.new(4) {Array.new(8) {NullPiece.instance}}
    # bboard = Array.new(2) {Array.new(8) {Piece.new(:b)}}
    @grid = Array.new(8) {Array.new(8)}
  end

  def populate_grid

      @grid.each_with_index do |row,row_idx|
        row.each_index do |col_idx|
          if row_idx < 2
            grid[row_idx][col_idx] = Piece.new(:w,[row_idx,col_idx])
          elsif row_idx >= 2 && row_idx < 6
            grid[row_idx][col_idx] = NullPiece.instance
          elsif row_idx > 5
            grid[row_idx][col_idx] = Piece.new(:b,[row_idx,col_idx])
          end
        end
      end
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
    unless valid_pos?(start_pos, end_pos)
      raise BadMoveError
    end
    current_piece = self[start_pos]
    captured_piece = self[end_pos]

    if current_piece.class == NullPiece
      raise NoPieceError # no piece at start
    elsif captured_piece.color == current_piece.color
      raise BadMoveError # friendly fire
    elsif captured_piece.color != current_piece.color
        # move under this condition only
        if captured_piece.class == NullPiece
          self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
        elsif captured_piece.color != current_piece.color
          self[end_pos] = self[start_pos]
          self[start_pos] = NullPiece.instance
        end

    end
  end

  def valid_pos?(start_pos, end_pos)
    if start_pos[0] > 7 || start_pos[1] > 7 || start_pos[0] < 0 || start_pos[1] < 0
      return false
    elsif end_pos[0] > 7 || end_pos[1] > 7 || end_pos[0] < 0 || end_pos[1] < 0
      return false
    end
    true
  end

end
