class T9Words
  def self.search
    dictionary_file = './data/dictionary.txt'

    if File.exists?(dictionary_file)
      names = File.readlines(dictionary_file)
      # Testing number: 87825
      puts names.select{|name| name[0].match(/[tuv]/) && name[1].match(/[pqrs]/) && name[2].match(/[tuv]/) && name[3].match(/[abc]/) && name[4].match(/[jkl]/) && name.strip.size == 5}.each{|w| w.strip!}
    else
      return "Error: Couldn't find the dictionary file."
    end
  end
end

T9Words.search
