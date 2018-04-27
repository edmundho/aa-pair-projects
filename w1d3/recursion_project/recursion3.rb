
def bsearch(array, target)
  winner_index = array.length / 2

  return nil if array.empty?
  return winner_index if array[winner_index] == target

  lessers = array.take(winner_index)#array[0...winner_index]
  greaters = array.drop(winner_index + 1)#array[winner_index..-1]

  case target <=> array[winner_index]
  when -1
    bsearch(lessers, target)
  when 0
    winner_index
  when 1
    answer_in_greaters = bsearch(greaters, target)
    answer_in_greaters.nil? ? nil : answer_in_greaters + (winner_index + 1)
  end
end

puts "For real?"
my_test = [1, 2, 3, 6, 8, 11, 13, 15, 19, 21, 22, 28]
p [my_test.length, my_test.index(22), bsearch(my_test, 22)]
puts "----------------"
p bsearch([1, 2, 3], 1) == 0
p bsearch([2, 3, 4, 5], 3) == 1
p bsearch([2, 4, 6, 8, 10], 6) == 2
p bsearch([1, 3, 4, 5, 9], 5) == 3
p bsearch([1, 2, 3, 4, 5, 6], 6) == 5
p bsearch([1, 2, 3, 4, 5, 6], 0) == nil
p bsearch([1, 2, 3, 4, 5, 7], 6) == nil
