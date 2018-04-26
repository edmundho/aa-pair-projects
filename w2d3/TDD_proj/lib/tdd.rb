class Array
  def my_uniq
    answer = []
    each do |el|
      answer << el unless answer.include?(el)
    end
    answer
  end

  def two_sum
    answer = []
    (0..length - 2).each do |i|
      (i + 1..length - 1).each do |j|
        answer << [i, j] if (self[i] + self[j]).zero?
      end
    end
    answer
  end

  def my_transpose
    answer = Array.new(length) { [] }
    each_with_index do |row, row_idx|
      each_with_index do |col, col_idx|
        answer[row_idx] << self[col_idx][row_idx]
      end
    end
    answer
  end
end
