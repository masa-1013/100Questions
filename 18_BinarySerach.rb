n = gets.to_i
$s = gets.split().map(&:to_i)
q = gets.to_i
t = gets.split().map(&:to_i)

def search(target, left, right)
  return $s[left] == target || $s[right] == target if right - left == 1
  index = (left + right) / 2
  if $s[index] <= target
    search(target, index, right)
  else
    search(target, left, index)
  end
end

ans = 0

t.each do |i|
  ans += 1 if (search(i, -1, n))
end

puts ans