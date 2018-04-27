
def subsets(array)
  return [[]] if array.empty?
  run_it = subsets(array[0...-1])

  new_array = []
  run_it.each do |el|
    new_array << el + [array[-1]]
  end

  run_it + new_array
  # run_it + run_it.map { |subbie| subbie + [array.last] }
end

p subsets([1, 2, 3])
