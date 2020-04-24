N = gets.to_i
tmp = 0
ans = 0

(1..N).each do |i|
  (1..i).each do |j|
    tmp += 1 if i % j == 0
  end
  ans += 1 if tmp == 8 and i % 2 == 1
  tmp = 0
end

puts ans