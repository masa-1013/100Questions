n = gets.to_i
position = []
ans = 100000000000

n.times do |i|
  position << gets.split().map(&:to_i)
end

array = position.flatten.sort

array.each do |s|
  array.each do |e|
    tmp = 0
    position.each do |a, b|
      tmp += (s-a).abs + (b-a).abs + (e-b).abs
    end
    ans = [ans, tmp].min
  end
end

puts ans