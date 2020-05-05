n, q = gets.split().map(&:to_i)
$graph = Array.new(n).map{Array.new()}
$seen = []
$ans = Array.new(n, 0)

(n-1).times do
  a, b = gets.split().map(&:to_i)
  $graph[a-1] << b-1
end

def dfs(root, point)
  $seen[root] = true
  $ans[root] += point
  $graph[root].each do |i|
    next if $seen[i]
    dfs(i, point) 
  end
end

q.times do 
  $seen = []
  root, point = gets.split().map(&:to_i)
  dfs(root-1, point)
end

puts $ans.join(' ')
