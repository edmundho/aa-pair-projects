class Card
  attr_reader :face_value
  attr_accessor :face_up

  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def hide
    @face_up = false
  end

end
