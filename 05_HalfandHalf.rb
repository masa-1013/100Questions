a, b, c, x, y = gets.split().map(&:to_i)

isabNeed = a+b > c*2

if isabNeed
  if x >= y
    puts [y * c * 2 + (x - y) * a, x * c * 2].min
  else
    puts [x * c * 2 + (y - x) * b, y * c * 2].min
  end
else
  puts a * x + b * y
end