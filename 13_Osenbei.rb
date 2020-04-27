r, c = gets.split().map(&:to_i)
field = []
ans = 0

r.times do 
  field << gets.split().map(&:to_i)
end

[0, 1].repeated_permutation(r) do |bits|
  sum = 0
  bits.each_with_index do |bit, index|
    next if bit == 0
    field[index].map!{|j| (j+1) % 2}
  end
  c.times do |j|
    tmp = 0
    r.times do |k|
      tmp += 1 if field[k][j] == 0
    end
    sum += [tmp, r-tmp].max
  end
  ans = [ans, sum].max
  bits.each_with_index do |bit, index|
    next if bit == 0
    field[index].map!{|j| (j+1) % 2}
  end
end

puts ans