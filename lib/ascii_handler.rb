# This class handles Ascii Art
class AsciiHandler
  def initialize
    @stages = [
      "
        +---+
        |   |
            |
            |
            |
            |
      =========
      ",
      "
        +---+
        |   |
        O   |
            |
            |
            |
      =========
      ",
      "
        +---+
        |   |
        O   |
        |   |
            |
            |
      =========
      ",
      "
        +---+
        |   |
        O   |
       /|   |
            |
            |
      =========
      ",
      "
        +---+
        |   |
        O   |
       /|\\  |
            |
            |
      ========
      ",
      "
        +---+
        |   |
        O   |
       /|\\  |
       /    |
            |
      =========
      ",
      "
        +---+
        |   |
        O   |
       /|\\  |
       / \\  |
            |
      =========
      "
    ]
    @won_art =
      "
        \\O/
         |
        / \\
      Congratulations!
      "
  end

  def print_stages
    puts @stages
    puts @won_art
  end
end

ascii_handler = AsciiHandler.new

ascii_handler.print_stages
