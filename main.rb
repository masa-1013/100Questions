n = 10
array = "1 33 43 12 29 1 8 2 6 6".split().map(&:to_i).sort
q = 100
numbers = "19 11 51 43 5 8 93 30 66 69 32 17 47 72 68 80 23 49 92 64 69 51 27 90 24 35 20 44 10 62 84 63 1 10 36 76 31 29 97 75 91 90 44 34 25 29 30 27 26 43 34 4 60 49 20 56 32 72 13 90 9 19 5 95 49 27 19 97 24 96 49 56 84 93 45 7 6 9 54 52 65 83 38 1 90 30 37 95 56 63 11 27 42 6 68 12 1 10 80 58
".split().map(&:to_i)
ans = []

(1..2**n-1).each do |i|
  sum = 0
  puts i.to_s(2).rjust(n, '0')
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

