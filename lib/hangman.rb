def display_gallows(used_guesses)
  puts " ________"
  puts "  |    \\|"
  puts "  #{used_guesses > 0 ? 'O' : ' '}     |"
  puts " #{used_guesses > 2 ? '-' : ' '}#{used_guesses > 1 ? '|' : ' '}#{used_guesses > 3 ? '-' : ' '}    |"
  puts " #{used_guesses > 4 ? '/' : ' '} #{used_guesses > 5 ? '\\' : ' '}    |"
  puts "        |"
  puts "==========="
end
