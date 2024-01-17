letters = %w(A B C D E F G H I J)
numbers = %w(1 2 3 4 5 6 7 8 9 10)

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
letters.each { |i| print ' ' + i }
puts
index = 0
positions.each do |i|
  print index < 9 ? numbers[index] + ' ' : numbers[index]
  i.each { |i| print i }
  puts 
  index += 1
end
