n = gets.to_i
$data = []

n.times do
  $data << gets.split().map(&:to_i)
end

def check(target)
  array = $data.map do |h, s|
    tmp = target-h
    if tmp < 0
       -1
    else
      tmp / s
    end
  end

  t = 0
  array.sort.each do |i|
    return false if i < t
    t += 1
  end
  return true
end


def search(left, right)
  return right if right - left == 1
  index = (left+right) / 2
  if check(index)
    search(left, index)
  else
    search(index, right)
  end
end

puts search(0, 10**19)