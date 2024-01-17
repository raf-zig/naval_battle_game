LETTERS = %w(A B C D E F G H I J)
NUMBERS = %w(1 2 3 4 5 6 7 8 9 10)

positions = []
10.times { positions << [] }
i = 0
10.times do
  10.times do
    positions[i] << ' .'
  end
  i += 1
end

print '  '
LETTERS.each { |i| print ' ' + i }
puts
index = 0
positions.each do |i|
  print index < 9 ? NUMBERS[index] + ' ' : NUMBERS[index]
  i.each { |i| print i }
  puts 
  index += 1
end

i = 0
while i < 3
  a = rand(9)
  b = rand(1..9)
  if positions[a][b] != ' *' and positions[a][b - 1] != ' *' 
    positions[a][b] = ' *'
    positions[a][b - 1] = ' *' 
    i += 1
  end
end

c = 0
while c < 4
  a = rand(9)
  b = rand(9)
    if positions[a][b] != ' +' and positions[a][b] != ' *'
      positions[a][b] = ' +'
      c += 1
    end
end

print '  '
LETTERS.each { |i| print ' ' + i }
puts
index = 0
positions.each do |i|
  print index < 9 ? NUMBERS[index] + ' ' : NUMBERS[index]
  i.each { |i| print i }
  puts 
  index += 1
end
 