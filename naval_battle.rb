LETTERS = %w(A B C D E F G H I J)
NUMBERS = %w(1 2 3 4 5 6 7 8 9 10)

spots = []
10.times { spots << [] }
i = 0
10.times do
  10.times do
    spots[i] << ' .'
  end
  i += 1
end
 
def show_area(spots)
  print '  '
  LETTERS.each { |i| print ' ' + i }
  puts
  index = 0
  
  spots.each do |i|
    print index < 9 ? NUMBERS[index] + ' ' : NUMBERS[index]
    i.each { |i| print i }
    puts 
    index += 1
  end
end

def place_ships(spots)
  i = 0
  while i < 3
    a = rand(9)
    b = rand(1..9)
    if spots[a][b] != ' *' and spots[a][b - 1] != ' *' 
      spots[a][b] = ' *'
      spots[a][b - 1] = ' *' 
      i += 1
    end
  end

  c = 0
  while c < 4
    a = rand(9)
    b = rand(9)
    if spots[a][b] != ' +' and spots[a][b] != ' *'
      spots[a][b] = ' +'
      c += 1
    end
  end
end

show_area(spots)
place_ships(spots)
show_area(spots)