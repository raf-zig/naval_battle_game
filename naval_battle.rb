# frozen_string_literal: true

LETTERS = %w[A B C D E F G H I J].freeze
NUMBERS = %w[1 2 3 4 5 6 7 8 9 10].freeze

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
  LETTERS.each { |i| print " #{i}" }
  puts
  index = 0

  spots.each do |i|
    print index < 9 ? "#{NUMBERS[index]} " : NUMBERS[index]
    i.each { |i| print i }
    puts
    index += 1
  end
end

def show_area_without_ships(spots)
  print '  '
  LETTERS.each { |i| print " #{i}" }
  puts
  index = 0

  spots.each do |i|
    print index < 9 ? "#{NUMBERS[index]} " : NUMBERS[index]
    i.each do |i|
      case i
      when ' .'
        print i
      when ' 0'
        print ' 0'
      when ' X'
        print ' X'
      else
        print ' .'
      end
    end
    puts
    index += 1
  end
end

def no_other_ships_nearby?(a, b, spots)
  if spots[a + 1][b - 2] == ' .' && spots[a + 1][b - 1] == ' .' && spots[a + 1][b] == ' .' &&
     spots[a + 1][b + 1] == ' .' && spots[a - 1][b - 2] == ' .' && spots[a - 1][b - 1] == ' .' &&
     spots[a - 1][b] == ' .' && spots[a - 1][b + 1] == ' .' && spots[a][b - 2] == ' .' &&
     spots[a][b - 1] == ' .' && spots[a][b + 1] == ' .'
    true
  end
end

def win?(spots)
  index = 0
  spots.each do |i|
    i.each { |i| index += 1 if i == ' X' }
  end
  true if index == 10
end

def place_ships(spots)
  index_1 = 0
  while index_1 < 3
    a = rand(9)
    b = rand(1..9)
    next unless spots[a][b] == ' .' && spots[a][b - 1] == ' .' && no_other_ships_nearby?(a, b, spots)

    spots[a][b] = ' ▷'
    spots[a][b - 1] = ' ▷'
    index_1 += 1
  end

  index_2 = 0
  while index_2 < 4
    a = rand(9)
    b = rand(9)
    if spots[a][b] == ' .' && no_other_ships_nearby?(a, b, spots)
      spots[a][b] = ' ▶'
      index_2 += 1
    end
  end
end

show_area(spots)
place_ships(spots)

loop do
  puts 'Take a gunshot by entering the coordinates as A5'
  puts 'A hit will be marked X, a miss is 0'
  input = gets.chomp.split('')

  if (input.size == 2 && LETTERS.include?(input[0]) && NUMBERS.include?(input[1])) ||
     (LETTERS.include?(input[0]) && input[1] == '1' && input[2] == '0' && input.size == 3)
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
                   end

    index_of_arr = 9 if input[1] == '1' && input[2] == '0'

    spots[index_of_arr][index_of_elenent] = if spots[index_of_arr][index_of_elenent] == ' ▶' || spots[index_of_arr][index_of_elenent] == ' ▷'
                                              ' X'
                                            else
                                              ' 0'
                                            end

    show_area_without_ships(spots)

  elsif input.join == 'surrender'
    puts 'What a shame…'
    show_area(spots)
    break
  else
    puts 'An incorrect cell address has been entered'
  end

  if win?(spots)
    puts 'You min!'
    break
  end
end
