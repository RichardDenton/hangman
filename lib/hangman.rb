require_relative 'colours'
require_relative 'game'

WORDS_FILE_NAME = '5desk.txt'

def display_menu
  system('clear')
  puts "Hangman".green.center(30)
  puts "-------".red.center(30)
  puts
  puts "1. Start a new game"
  puts "2. Load a saved game"
  puts
  print "Please enter your choice: "
end

def get_choice
  choice = nil
  until choice == '1' || choice == '2' do
    choice = gets.chomp
    display_menu unless choice =='1' || choice == '2'
  end
  choice
end

def start_game(choice)
  if choice == '1'
    word_list = read_words(WORDS_FILE_NAME)
    game = Game.new(word_list.sample)
    game.play
  else
    puts "Not yet implemented"
  end
end

def read_words(words_file_name)
  # Returns a list of words from the word file with lengths between 5 and 12 characters

  words = []

  File.open(words_file_name).readlines.each do |word|
    if word.chomp.length >4 && word.chomp.length < 13
      words.push(word.chomp.downcase)
    end
  end

  words
end


display_menu
start_game(get_choice)