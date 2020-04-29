circle = gets.to_i
shopNumber = gets.to_i
orderNumber = gets.to_i
$shopPosition = [0]
orderPosition = []

(shopNumber-1).times do
  $shopPosition << gets.to_i
end

$shopPosition << circle
$shopPosition.sort!

orderNumber.times do
  orderPosition << gets.to_i
end

def search(target, left, right)
  if right - left == 1
    return [(target - $shopPosition[left]).abs, ($shopPosition[right] - target).abs].min
  end
  index = (left + right) / 2
  if target <= $shopPosition[index]
    search(target, left, index)
  else
    search(target, index, right)
  end
end

ans = 0

orderPosition.each do |i|
  ans += search(i, -1, shopNumber+1)
end

puts ans