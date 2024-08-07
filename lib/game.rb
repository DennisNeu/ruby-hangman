require_relative "file_handler"
require_relative "ascii_handler"

# Class with game logic
class Game
  def initialize(max_tries, path)
    @max_tries = max_tries
    @current_try = 0
    @file_handler = FileHandler.new(path)
    @ascii_handler = AsciiHandler.new
    @wordlist = @file_handler.wordlist
    @chosen_word = choose_word
    @guessed_letters = []
    @solution_string = ""
  end

  def start_game
    print_introduction
    while(true)
      @guessed_letters << userinput

    end
  end

  #private

  def choose_word
    @wordlist.sample
  end

  def userinput
    while(true)
      puts "Pick a letter! DRY"
      input = gets.chomp.downcase

      break if letter?(input) && !@guessed_letters.include?(input)
    end
    input
  end

  def char_indices(char, string)
    indices = []
    string.each_char.with_index do |c, index|
      indices << index if c == char
    end
    indices
  end

  def letter?(string)
    !!(string =~ /^[A-Za-z]$/)
  end

  def build_solution_string
    @solution_string = "_" * @choose_word.length
    @guessed_letters.each do |char|
      if @chosen_word.include?(char)
        indices = char_indices(char, @chosen_word)
        indices.each do |index|
          @solution_string[index] = char
        end
      end
    end
  end

  def print_introduction
    puts "This is a game of hangman"
    puts "You have #{@guess_amount} guesses!"
    puts "A random word has been chosen"
    puts ascii_handler.won_art
  end
end
