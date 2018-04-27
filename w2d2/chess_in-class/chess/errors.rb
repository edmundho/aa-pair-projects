class NoPieceError < Exception
  def message
    "There is no piece at start_pos"
  end
end

class BadMoveError < Exception
  def message
    "Invalid Move"
  end
end
