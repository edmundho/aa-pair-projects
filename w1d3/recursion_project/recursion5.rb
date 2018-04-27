
def merge_sort(array)
  return array if array.length < 2

  middle = array.length / 2
  sorted_left = merge_sort(array.take(middle))
  sorted_right = merge_sort(array.drop(middle))
  merge(sorted_left, sorted_right)
end

def merge(array1, array2)
  sorted_array = []

  until array1.empty? || array2.empty?
    sorted_array << ((array1.first < array2.first) ? array1.shift : array2.shift)
  end

  sorted_array + array1 + array2
end

start_time = Time.now
p my_test = (0..19).to_a.shuffle
p merge_sort(my_test)
p end_time = Time.now - start_time
