class T9Words
  def self.search
    dictionary_file = './data/dictionary.txt'

    if File.exists?(dictionary_file)
      @names = File.readlines(dictionary_file)
      return "#{@names.size} words found."
    else
      return "Error: Couldn't find the dictionary file."
    end
  end
end
