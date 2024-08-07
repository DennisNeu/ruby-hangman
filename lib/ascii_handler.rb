# This class handles Ascii Art
class AsciiHandler
  attr_reader :stages, :won_art

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
