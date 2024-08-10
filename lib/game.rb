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
      if @current_try > 5
        puts "you lost!"
        restart
        break
      end
      @guessed_letters << userinput
      @current_try = @current_try + 1
      @ascii_handler.print_stages(@current_try)
      puts "Tries left: #{@max_tries - @current_try}"
      puts "you guessed: "
      puts @guessed_letters.join(" ")
      build_solution_string
      puts @chosen_word
      puts @solution_string
      if @chosen_word.strip == @solution_string.strip
        puts "you won!"
        puts @ascii_handler.won_art
        restart
        break
      end
    end
  end

  private

  def choose_word
    word = @wordlist.sample
    while (word.length > 6)
      word = @wordlist.sample
    end
    word
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
    @solution_string = "_" * (@chosen_word.length - 1)
    @guessed_letters.each do |char|
      if @chosen_word.include?(char)
        indices = char_indices(char, @chosen_word)
        indices.each do |index|
          @solution_string[index] = char
        end
      end
    end
    puts @solution_string
  end

  def print_introduction
    puts "This is a game of hangman"
    puts "You have #{@max_tries} guesses!"
    puts "A random word has been chosen"
    puts @ascii_handler.stages[0]
  end

  def restart
    puts "Press a key to restart the game"
    input = gets
    unless input.nil?
      reset_params
      start_game
    end
  end

  def reset_params
    @current_try = 0
    @chosen_word = choose_word
    @guessed_letters = []
    @solution_string = ""
  end
end
