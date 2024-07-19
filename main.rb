require_relative "lib/file_handler.rb"

file_handler = FileHandler.new("./wordlist.txt")

puts file_handler.wordlist
