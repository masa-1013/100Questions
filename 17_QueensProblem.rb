k = gets.to_i
$queens = []
$field = Array.new(8).map{Array.new(8, false)}
ans = Array.new(8).map{Array.new(8, '.')}
row = [*0..7]
column = [*0..7]
$dx = [1,1,0,-1,-1,-1,0,1]
$dy = [0,1,1,1,0,-1,-1,-1]


k.times do
  $queens << gets.split().map(&:to_i)
end

$queens.each do |r, c|
  ans[r][c] = 'Q'
  column.delete(c)
  row.delete(r)
end

def initializeField()
  8.times do |i|
    8.times do |j|
      $field[i][j] = false
    end
  end
  $queens.each do |r, c|
    updateField(c, r)
  end
end

def updateField(x, y)
  return false if $field[x][y]
  $field[x][y] = true
  7.times do |i|
    8.times do |j|
      nx = $dx[j] * (i+1) + x
      ny = $dy[j] * (i+1) + y
      next if (nx < 0 || nx > 7 || ny < 0 || ny > 7)
      return false if $field[nx][ny]
    end
  end
  return true
end

column.permutation.to_a.each do |arrayX|
  initializeField()
  flag = true
  arrayX.each_with_index do |i, index|
    next if updateField(i, row[index])
    flag = false
    break
  end
  if flag
    arrayX.each_with_index do |i, index|
      ans[row[index]][i] = 'Q'
    end
    ans.each do |array|
      puts array.join('')
    end
    exit
  end
end










