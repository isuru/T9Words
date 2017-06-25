class T9Words
  def self.search
    dictionary_file = './data/dictionary.txt'

    if File.exists?(dictionary_file)
      names = File.readlines(dictionary_file)
      # Testing number: 87825
      phone = "87825"
      t9_map = {
        2 => /[abc]/,
        3 => /[def]/,
        4 => /[ghi]/,
        5 => /[jkl]/,
        6 => /[mno]/,
        7 => /[pqrs]/,
        8 => /[tuv]/,
        9 => /[wxyz]/
      }
      puts names.select{|name| name[0].match(t9_map[phone[0].to_i]) && name[1].match(t9_map[phone[1].to_i]) && name[2].match(t9_map[phone[2].to_i]) && name[3].match(t9_map[phone[3].to_i]) && name[4].match(t9_map[phone[4].to_i]) && name.strip.size == phone.size}.each{|w| w.strip!}
    else
      return "Error: Couldn't find the dictionary file."
    end
  end
end

T9Words.search
