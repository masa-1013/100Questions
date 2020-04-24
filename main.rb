n = 10
$cordinates = [[9,4],[4,3],[1,1],[4,2],[2,4],[5,8],[4,0],[5,3],[0,5],[5,2]]
ans = 0


$cordinates.sort!

def search(target, ok, ng)
  while ng-ok > 1
    mid = ok+ng / 2
    if [$cordinates[mid], target].sort[1] == target
      ok = mid
    else
      ng = mid
    end
  end
  return $cordinates[ok] == target || $cordinates[ng] == target
end

$cordinates.each do |xi, yi|
  $cordinates.each do |xj, yj|
    next if xi == xj && yi == yj
    q = [xi - yj + yi, yi + xj - xi]
    r = [xj - yj + yi, yj + xj - xi]
    if search(q, -1, n) && search(r, -1, n)
      ans = [ans, (xj - xi)**2 + (yj - yi)**2].max
    end
  end
end

puts ans