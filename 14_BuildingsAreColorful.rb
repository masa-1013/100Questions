n, k = gets.split().map(&:to_i)
a = gets.split().map(&:to_i)

len = n - 1
target = k - 1
cost = 10000000000000

[0, 1].repeated_permutation(len) do |bits|
  next unless bits.count(1) == target
  baseH = a[0]
  sum = 0
  bits.each_with_index do |bit, index|
    next if bit == 0
    baseH = [a[0..index].max, baseH].max
    if baseH < a[index+1]
      baseH = a[index+1]
    else
      sum += baseH - a[index+1] + 1
      baseH += 1
    end
  end
  cost = [cost, sum].min
end

puts cost


