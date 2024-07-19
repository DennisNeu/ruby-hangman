require_relative "file_handler"

# Class with game logic
class Game
  def initialize(guess_amount, path)
    @guess_amount = guess_amount
    @file_handler = FileHandler.new(path)
    @wordlist = @file_handler.wordlist
    @chosen_word = choose_word
    @guessed_letters = Array.new
    @solution_string =
  end

  #private

  def choose_word()
    @wordlist.sample
  end

  def userinput()
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

  def build_solution_string()
    @solution_string = "_" * @choose_word.length
  end
end
