n = 4
$graph = [[2], [4], [], [3]]
$seen = Array.new(n, false)
$ans = Array.new(n, Array.new(2, 0))


def dfs(s, time)
  $seen[s] = true
  $ans[s][0] = time
  time += 1 
  $graph[s].each do |node|
    next if $seen[node-1]
    dfs(node-1, time)
  end
  $ans[s][1] = time
end


dfs(0, 1)

$ans.each_with_index do |s, e, index|
  puts "#{index+1} #{s} #{e}"
end

