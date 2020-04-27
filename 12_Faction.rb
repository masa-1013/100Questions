n, m = gets.split().map(&:to_i)
relation = []
ans = 1

m.times do 
  relation << gets.split().map(&:to_i)
end

(1..2**n-1).each do |i|
  tmp = []
  flag = true
  i.to_s(2).rjust(n, '0').split('').reverse.each_with_index do |bit, index|
    next if bit == '0'
    tmp << index + 1
  end
  (0..tmp.size-1).each do |j|
    (j+1..tmp.size-1).each do |k|
      next if relation.include?([tmp[j], tmp[k]])
      flag = false
    end
  end
  ans = [ans, tmp.size].max if flag
end

puts ans
