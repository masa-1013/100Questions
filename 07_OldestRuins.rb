n = gets.to_i
$cordinates = []
ans = 0
n.times do 
  $cordinates << gets.split().map(&:to_i)
end

$cordinates.sort!

def search(target, ok, ng)
  while ng-ok > 1
    mid = (ok+ng) / 2
    if [$cordinates[mid], target].sort[1] == target
      ok = mid
    else
      ng = mid
    end
  end
  return $cordinates[ok] == target || $cordinates[ng] == target
end

(0..n-1).each do |i|
  (i+1..n-1).each do |j|
    xi = $cordinates[i][0]
    yi = $cordinates[i][1]
    xj = $cordinates[j][0]
    yj = $cordinates[j][1]
    q = [xi - yj + yi, yi + xj - xi]
    r = [xj - yj + yi, yj + xj - xi]
    if search(q, -1, n) && search(r, -1, n)
      ans = [ans, (xj - xi)**2 + (yj - yi)**2].max
    end
  end
end

puts ans
