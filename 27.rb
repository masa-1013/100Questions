$w = gets.to_i
$h = gets.to_i
$sections = Array.new($h)
$seen = Array.new($h).map{Array.new($w, false)}
$dx = [1, 0, -1, 0]
$dy = [0, 1, 0, -1]
$ans = 0

$h.times do |i|
  $sections[i] = gets.split().map(&:to_i)
end

def dfs(h, w, point)
  $seen[h][w] = true
  point += 1
  4.times do |i|
    nw = $dx[i] + w
    nh = $dy[i] + h
    next if nw < 0 || nw >= $w || nh < 0 || nh >= $h
    next if $sections[nh][nw] == 0
    next if $seen[nh][nw]
    dfs(nh, nw, point)
  end
  $ans = [$ans, point].max
  return point
end


$h.times do |i|
  $w.times do |j|
    next if $sections[i][j] == 0
    $seen = Array.new($h).map{Array.new($w, false)}
    dfs(i, j, 0)
  end
end

puts $ans
