require_relative 'colours'
require_relative 'game'

WORDS_FILE_NAME = '5desk.txt'
SAVE_FILE_PATH = 'saves/saved'

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
    game = new_game
  else
    game = load_game
  end
  game.play
end

def new_game
  word_list = read_words(WORDS_FILE_NAME)
  Game.new(word_list.sample)
end

def load_game
  if File.exist?(SAVE_FILE_PATH)
    saved_game_file = File.open(SAVE_FILE_PATH, "r")
    return Marshal::load(saved_game_file)
  else
    puts "You haven't got a saved games starting a new game instead..."
    return new_game
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