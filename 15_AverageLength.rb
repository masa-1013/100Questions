n = gets.to_i
ans = 0
count = 0
cities = []

n.times do 
  cities << gets.split().map(&:to_i)
end

cities.permutation.to_a.each do |array|
  array.each_cons(2) do |(x1, y1), (x2, y2)|
    ans += ((x1-x2)**2 + (y1-y2)**2)**0.5
  end
  count += 1
end

puts ans / count