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

def show_area_without_ships(spots)
  print '  '
  LETTERS.each { |i| print ' ' + i }
  puts
  index = 0
  
  spots.each do |i|
    print index < 9 ? NUMBERS[index] + ' ' : NUMBERS[index]
    i.each do |i|
      if i == ' .' 
        print i
      elsif i == ' 0'
        print ' 0'
      elsif i == ' x'
        print ' x'
      else
        print ' .'
      end
    end
    puts 
    index += 1
  end
end

def place_ships(spots)
  i = 0
  while i < 3
    a = rand(9)
    b = rand(1..9)
    if spots[a][b] != ' ▷' and spots[a][b - 1] != ' ▷' 
      spots[a][b] = ' ▷'
      spots[a][b - 1] = ' ▷' 
      i += 1
    end
  end

  c = 0
  while c < 4
    a = rand(9)
    b = rand(9)
    if spots[a][b] != ' ▶' and spots[a][b] != ' ▷'
      spots[a][b] = ' ▶'
      c += 1
    end
  end
end

show_area(spots)
place_ships(spots)

input = gets.chomp.split('')
puts input[0], input[1]

index_of_elenent = case input[0]
  when 'A' then 0
  when 'B' then 1
  when 'C' then 2
  when 'D' then 3
  when 'E' then 4
  when 'F' then 5
  when 'G' then 6
  when 'H' then 7
  when 'I' then 8
  when 'J' then 9
end

index_of_arr = case input[1]
  when '1' then 0
  when '2' then 1
  when '3' then 2
  when '4' then 3
  when '5' then 4
  when '6' then 5
  when '7' then 6
  when '8' then 7
  when '9' then 8
  when '10' then 9
end

if spots[index_of_arr][index_of_elenent] == ' ▶' || spots[index_of_arr][index_of_elenent] == ' ▷'
  spots[index_of_arr][index_of_elenent] = ' x'
else
  spots[index_of_arr][index_of_elenent] = ' 0'
end

#p index_of_elenent
#p index_of_arr
show_area_without_ships(spots)
show_area(spots)