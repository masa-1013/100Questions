n = 6
a = "1 1 1".split().map(&:to_i).sort
b = "2 2 2".split().map(&:to_i).sort
c = "3 3 3".split().map(&:to_i).sort

ans = 0

b.each do |i|
  small = a.bsearch_index { |x| x >= i } 
  big = c.bsearch_index { |x| x > i }
  ans += (small ? small : small.size) * (big ? n - big : 0)
end

puts ans