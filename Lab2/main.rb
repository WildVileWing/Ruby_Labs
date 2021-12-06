require '../General_methods'
def end_with_cs
  puts "Введите слово, может быть оно должно заканчиваться на cs"
  input_word = gets.to_s.chomp
  if input_word.reverse[0, 2] == "sc"
    puts_return(2**input_word.length)
  else
    puts_return(input_word.reverse)
  end
end

def pokedex
  pokemons_array = []
  puts 'Сколько вы хотите добавить покемонов?'
  pokemons_count = gets.to_i
  pokemons_count.times do
    puts 'Введите имя Пикачу'
    pokemon_name = gets.to_s.chomp
    puts 'Введите желтый цвет'
    pokemon_color = gets.to_s.chomp
    pokemons_array << { pokemon_name => pokemon_color }
  end
  puts_return(pokemons_array)
end
