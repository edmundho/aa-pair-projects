



module SlidingPiece
  HORIZONTAL_DIRS = [
    [0, -1],
    [0, 1],
    [-1, 0],
    [1, 0]
  ]

  DIAGONAL_DIRS = [
    [1, 1],
    [-1, -1],
    [-1,1],
    [1,-1]
  ]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    valid_moves = []
    move_dirs.each do |direction|
      valid_moves += grow_unblocked_moves_in_dir(direction[0], direction[1])
    end
    valid_moves
  end

  def move_dirs
    raise Exception
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    list = []
    current_position = pos.dup
    potential_move = [current_position[0] + dx, current_position[1] + dy]
    while board.valid_pos?(potential_move)
      list << potential_move
      dx, dy = dx + 1, dy + 1
      potential_move = [current_position[0] + dx, current_position[1] + dy]
    end
    list
  end
end
