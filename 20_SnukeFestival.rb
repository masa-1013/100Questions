n = gets.to_i
a = gets.split().map(&:to_i).sort
b = gets.split().map(&:to_i).sort
c = gets.split().map(&:to_i).sort

ans = 0

b.each do |i|
  small = a.bsearch_index { |x| x >= i } 
  big = c.bsearch_index { |x| x > i }
  ans += (small ? small : a.size) * (big ? n - big : 0)
end

puts ans