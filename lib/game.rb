class Game
  def initialize(word)
    @word = word
    @letters = word.split('')
    @all_guessed_letters = []
    @allowed_guesses = 6
    @wrong_guesses = 0
    @revealed_letters = Array.new(@word.length) { |letter| '_' }
  end

  def play
    while true do
      display_gallows(@wrong_guesses)
      display_status
      break if game_over?
      guess = get_guess
      evaluate_guess(guess)
    end
    
    declare_result
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

  def display_status
    puts
    puts "#{@revealed_letters.join(' ')} \tUsed letters: #{@all_guessed_letters.join()}"
    puts "\nYou have #{@allowed_guesses - @wrong_guesses} guesses left."
    puts
  end

  def get_guess
    guess = ''
    until (guess[/[a-zA-Z]+/] && guess.length == 1 && !@all_guessed_letters.include?(guess)) || guess == '*' do
      puts "Enter the character * to save the game"
      print "Please enter your guess (a-z): "
      guess = gets.downcase.chomp
    end
    @all_guessed_letters.push(guess) unless guess == '*'
    guess.downcase
  end

  def evaluate_guess(guess)
    if guess == '*'
      save_game
    elsif correct_guess?(guess)
      update_revealed_letters(guess)
    else
      @wrong_guesses += 1
    end
  end

  def correct_guess?(guess)
    @letters.include?(guess)
  end

  def update_revealed_letters(guess)
    @letters.each_with_index do |letter, index|
      @revealed_letters[index] = guess if letter == guess
    end
  end

  def game_over?
    if @wrong_guesses == @allowed_guesses || @revealed_letters.join() == @word
      return true
    end
    false
  end

  def declare_result
    if @revealed_letters.join == @word
      puts "Congratulations you won!"
    else
      puts "The word was #{@word}"
      puts "Better luck next time!"
    end
  end

  def save_game
    puts "Saving"
  end
end