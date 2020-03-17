def solution(n, x)
  ans = 0
  (1..n).each do |i|
    (i+1..n).each do |j|
      (j+1..n).each do |k|
        ans+=1 if x == (i+j+k)
      end
    end
  end
  puts ans
end

array = []

loop do
  n, x = gets.chomp.split().map(&:to_i)
  break if n == 0 and x == 0
  array << [n, x]
end

array.each do |n, x| 
  solution(n, x)
end