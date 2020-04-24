n = gets.to_i
array = gets.chomp.split().map(&:to_i).sort
q = gets.to_i
numbers = gets.chomp.split().map(&:to_i)
ans = []

(1..2**n-1).each do |i|
  sum = 0
  i.to_s(2).rjust(n, '0').split('').each_with_index do |bit, index|
    next if bit == '0'
    sum += array[index]
  end
  ans << sum
end

ans = ans.uniq.sort

numbers.each do |i|
  puts ans.include?(i) ? "yes" : "no"
end

