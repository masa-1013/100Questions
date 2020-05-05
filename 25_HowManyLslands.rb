$dx = [1,1,0,-1,-1,-1,0,1]
$dy = [0,1,1,1,0,-1,-1,-1]
$maxW = 0
$maxH = 0
$seen = []
$islandsMap = []
$ans = []

def HowManyLslands()
  $islandsMap = []
  $seen = Array.new($maxH).map{Array.new($maxW, false)}
  $maxH.times do
    $islandsMap << gets.split().map(&:to_i)
  end
  doSearch($maxH, $maxW)
end

def dfs(h, w)
  $seen[h][w] = true
  8.times do |i|
    nw = $dx[i] + w
    nh = $dy[i] + h
    next if nw < 0 || nw >= $maxW || nh < 0 || nh >= $maxH
    next if $islandsMap[nh][nw] == 0
    next if $seen[nh][nw]
    dfs(nh, nw)
  end
end

def doSearch(h, w)
  count = 0
  h.times do |i|
    w.times do |j|
      if $islandsMap[i][j] == 0
        $seen[i][j] = true
        next
      end
      next if $seen[i][j]
      dfs(i, j)
      count += 1
    end
  end
  $ans << count
end


loop do
  $maxW, $maxH = gets.split().map(&:to_i)
  break if $maxW == 0 && $maxH == 0
  HowManyLslands()
end

$ans.each{|i| puts i}