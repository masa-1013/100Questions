n = gets.to_i
s = gets.chomp.split('')
ans = 0

(0..999).each do |i|
  str = sprintf("%03d", i)
  tmp = 0
  flag = true
  str.split('').each do |j|
    index = s[tmp..-1].index(j)
    if index
      tmp += index + 1
    else
      flag = false
      break
    end
  end
  ans += 1 if flag
end

puts ans