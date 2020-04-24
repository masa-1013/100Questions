n, m = gets.chomp.split().map(&:to_i)
points = []

n.times do 
  points << gets.chomp.split().map(&:to_i)
end

ans = 0

(0..m-1).each do |i|
  (i..m-1).each do |j|
    ans = [ans, points.inject(0) { |sum, point| sum += [point[i], point[j]].max }].max
  end
end

puts ans