def pokemons
  print "Enter a number of your pokemons: "
  input = gets.to_i

  pokemons = {}

  if input != 0
    input.times do |x|
      print "Enter name of your pokemon "
      name = gets.chomp!

      print "Enter color of your pokemon "
      color = gets.chomp!

      pokemons[name] = color

      pokemons
    end
  else
    puts "Please enter a number"
  end
end

# puts pokemons()