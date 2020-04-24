n = gets.to_i
stars1 = []
stars2 = []

n.times do 
  stars1 << gets.split().map(&:to_i)
end

m = gets.to_i
m.times do 
  stars2 << gets.split().map(&:to_i)
end

stars1.sort!
stars2.sort!

stars2.each do |x2, y2|
  flag = true
  transX = x2 - stars1[0][0]
  transY = y2 - stars1[0][1]
  stars1.each do |x1, y1|
    unless stars2.include?([x1+transX, y1+transY])
      flag = false
      break
    end
  end
  if flag
    puts "#{transX} #{transY}"
    exit
  end
end
