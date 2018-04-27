
def deep_dup(array)
  new_array = []

  array.each do |el|
    if el.is_a?(Array)
      new_array << deep_dup(el)
    else
      new_array << el
    end
  end
  new_array

end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]
p robot_parts_copy = deep_dup(robot_parts)
# shouldn't modify robot_parts
robot_parts_copy[1] << "LEDs"
# but it does
p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

p robot_parts_copy
