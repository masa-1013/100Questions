n, x = 5, 9

ans = 0

(1..n).each do |i|
  (1..n).each do |j|
    next if i == j
    (1..n).each do |k|
      next if i == k || j == k
      ans+=1 if x == (i+j+k)
    end
  end
end

puts ans