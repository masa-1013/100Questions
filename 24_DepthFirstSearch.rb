n = gets.to_i
$graph = []
$seen = Array.new(n, false)
$ans = Array.new(n).map{Array.new(2, 0)}
$time = 1

n.times do |i|
  tmp = []
  gets.split().map(&:to_i).each_with_index do |value, index|
    next if index == 0 || index == 1
    tmp << value
  end
  $graph << tmp
end

def dfs(s)
  $seen[s] = true
  $ans[s][0] = $time
  $time += 1 
  $graph[s].each do |node|
    next if $seen[node-1]
    dfs(node-1)
  end
  $ans[s][1] = $time
  $time += 1
end

$seen.each_with_index do |value, index|
  next if value
  dfs(index)
end

$ans.each_with_index do |array, index|
  puts "#{index+1} #{array[0]} #{array[1]}"
end

