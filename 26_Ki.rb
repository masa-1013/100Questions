n, q = gets.split().map(&:to_i)
$graph = Array.new(n).map{Array.new()}
$seen = []
$ans = Array.new(n, 0)

(n-1).times do
  a, b = gets.split().map(&:to_i)
  $graph[a-1] << b-1
  $graph[b-1] << a-1
end

q.times do 
  root, point = gets.split().map(&:to_i)
  $ans[root-1] += point
end

que=[0]
while n=que.shift
  $seen[n] = true
  $graph[n].each do |to|
    next if $seen[to]
    $ans[to] += $ans[n]
    que << to
  end 
end

puts $ans.join(' ')