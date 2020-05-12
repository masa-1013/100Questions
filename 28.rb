n = gets.to_i
graph = Array.new(n)

n.times do |i|
  input = gets.split().map(&:to_i)
  tmp = []
  input[1].times do |j|
    tmp << input[j+2]-1
  end
  graph[i] = tmp
end

dist = Array.new(n, -1)
queue = []

dist[0] = 0
queue << 0

while !queue.empty?
  v = queue.shift
  graph[v].each do |i|
    next if dist[i] != -1
    dist[i] = dist[v] + 1
    queue << i
  end
end

dist.each_with_index do |i, index|
  puts "#{index+1} #{i}"
end