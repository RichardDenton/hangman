require_relative 'colours'

def display_gallows(used_guesses)
  puts " ________".yellow
  puts "  #{'|'.cyan}    #{'\\|'.yellow}"
  puts "  #{used_guesses > 0 ? 'O'.white : ' '}     #{'|'.yellow}"
  puts " #{used_guesses > 2 ? '-'.white : ' '}#{used_guesses > 1 ? '|'.white : ' '}#{used_guesses > 3 ? '-'.white : ' '}    #{'|'.yellow}"
  puts " #{used_guesses > 4 ? '/'.white : ' '} #{used_guesses > 5 ? '\\'.white : ' '}    #{'|'.yellow}"
  puts "        |".yellow
  puts "===========".yellow
end
