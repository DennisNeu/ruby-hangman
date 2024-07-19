class FileHandler
  attr_reader :wordlist
  def initialize(path)
    @path = path
    @wordlist = load_wordlist(path)
  end

  private

  def load_wordlist(path)
    return 1 unless File.exist?(path)
    @wordlist = File.readlines("wordlist.txt")
  end
end
