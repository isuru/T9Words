class T9Words
  def self.search(phone_number)
    phone = phone_number.to_s

    dictionary_file = './data/dictionary.txt'

    if File.exists?(dictionary_file)
      names = File.readlines(dictionary_file)
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

      # 3|7 match:
      # 668 | 6787825
      names_3L = names.select{|name| name[0].match(t9_map[phone[0].to_i]) && name[1].match(t9_map[phone[1].to_i]) && name[2].match(t9_map[phone[2].to_i]) && name.strip.size == 3}
      names_7R = names.select{|name| name[0].match(t9_map[phone[3].to_i]) && name[1].match(t9_map[phone[4].to_i]) && name[2].match(t9_map[phone[5].to_i]) && name[3].match(t9_map[phone[6].to_i]) && name[4].match(t9_map[phone[7].to_i]) && name[5].match(t9_map[phone[8].to_i]) && name[6].match(t9_map[phone[9].to_i]) && name.strip.size == 7}
      #
      puts names_3L
      puts names_7R

      puts "-----------"
      # 4|6 match:
      # 6686 | 787825
      names_4L = names.select{|name| name[0].match(t9_map[phone[0].to_i]) && name[1].match(t9_map[phone[1].to_i]) && name[2].match(t9_map[phone[2].to_i]) && name[3].match(t9_map[phone[3].to_i]) && name.strip.size == 4}
      names_6R = names.select{|name| name[0].match(t9_map[phone[4].to_i]) && name[1].match(t9_map[phone[5].to_i]) && name[2].match(t9_map[phone[6].to_i]) && name[3].match(t9_map[phone[7].to_i]) && name[4].match(t9_map[phone[8].to_i]) && name[5].match(t9_map[phone[9].to_i]) && name.strip.size == 6}

      puts names_4L
      puts names_6R

      puts "-----------"
      # 5|5 match:
      # 66867 | 87825
      names_5L = names.select{|name| name[0].match(t9_map[phone[0].to_i]) && name[1].match(t9_map[phone[1].to_i]) && name[2].match(t9_map[phone[2].to_i]) && name[3].match(t9_map[phone[3].to_i]) && name[4].match(t9_map[phone[4].to_i]) && name.strip.size == 5}
      names_5R = names.select{|name| name[0].match(t9_map[phone[4].to_i]) && name[1].match(t9_map[phone[5].to_i]) && name[2].match(t9_map[phone[6].to_i]) && name[3].match(t9_map[phone[7].to_i]) && name[4].match(t9_map[phone[8].to_i]) && name.strip.size == 5}

      puts names_5L
      puts names_5R


      # puts names.select{|name| name[0].match(t9_map[phone[0].to_i]) && name[1].match(t9_map[phone[1].to_i]) && name[2].match(t9_map[phone[2].to_i]) && name[3].match(t9_map[phone[3].to_i]) && name[4].match(t9_map[phone[4].to_i]) && name.strip.size == phone.size}.each{|w| w.strip!}
    else
      return "Error: Couldn't find the dictionary file."
    end
  end
end

T9Words.search "6686787825"
