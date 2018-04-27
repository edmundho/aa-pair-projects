
def permutations(array)
  return [array] if array.length < 2

  splice_this_in = array.shift

  perms = permutations(array)

  perm_list = []

  perms.each do |perm|
    # (0..perm.length).each do |i|
    (perm.length + 1).times do |i|
      perm_list << perm[0...i] + [splice_this_in] + perm[i..-1]
    end
  end

  perm_list
end

p permutations([1, 2, 3])
