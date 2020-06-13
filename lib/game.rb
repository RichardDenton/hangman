class Game
  def initialize(word)
    @word = word
    @letters = word.split('')
    @guessed_letters = []
    @wrong_guesses = 0
    @letters_prompt = "_ " * @word.length
  end

  def play
    game_over = false
    until game_over do
      display_gallows(@wrong_guesses)
      # puts @word
      puts "\n#{@letters_prompt}"
      puts "\nYou have #{6 - @wrong_guesses} allowed incorrect guesses left."
      puts
      guess = get_guess
      check_guess(guess)
      game_over = true
    end
  end
 
  private
  def display_gallows(wrong_guesses)
    # Displays the gallows completed according to the number of guesses used

    puts " ________".yellow
    puts "  #{'|'.cyan}    #{'\\|'.yellow}"
    puts "  #{wrong_guesses > 0 ? 'O'.white : ' '}     #{'|'.yellow}"
    puts " #{wrong_guesses > 2 ? '-'.white : ' '}#{wrong_guesses > 1 ? '|'.white : ' '}#{wrong_guesses > 3 ? '-'.white : ' '}    #{'|'.yellow}"
    puts " #{wrong_guesses > 4 ? '/'.white : ' '} #{wrong_guesses > 5 ? '\\'.white : ' '}    #{'|'.yellow}"
    puts "        |".yellow
    puts "===========".yellow
  end

  def get_guess
    guess = ''
    until guess[/[a-zA-Z]+/] && guess.length == 1 do
      print "Please enter your guess (a-z): "
      guess = gets.chomp
    end
    guess.downcase
  end

  def check_guess(guess)
  end
end