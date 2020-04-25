$H, $W = gets.split().map(&:to_i)
$field = []
$seen = []
$dx = [1, 0, -1, 0]
$dy = [0, 1, 0, -1]

$H.times do 
  $field << gets.chomp.split('')
end

def dfs(h, w)
  $seen[h][w] = true

  4.times do |i|
    nh = h + $dx[i]
    nw = w + $dy[i]

    #進めるかどうか判定
    next if (nh < 0 || nh >= $H || nw < 0 || nw >= $W)
    next if ($field[nh][nw] == "#")

    #探索済か
    next if ($seen[nh][nw])

    dfs(nh, nw)
  end
end

sh, sw, gh, gw = 0, 0, 0, 0
#スタートとゴールを求める
$H.times do |i|
  $W.times do |j|
    if $field[i][j] == 's'
      sh = i
      sw = j
    end
    if $field[i][j] == 'g'
      gh = i
      gw = j
    end
  end
end

#seenの初期化 
500.times do 
  $seen << Array.new(500, false)
end

dfs(sh, sw)

puts $seen[gh][gw] ? "Yes" : "No" 
