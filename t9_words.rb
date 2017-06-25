class T9Words
  def self.search(phone_number)
    phone = phone_number.to_s

    dictionary_file = './data/dictionary.txt'

    if File.exists?(dictionary_file)
      all_names = File.readlines(dictionary_file)
      names = all_names.select{ |name| name if (name.size >= 3 && name.size <= 11) } # Limitting to 3..10 character words (11 for including \n character)

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

      words = []

      # 3|7 match:
      # 668 | 6787825
      names_3L = names.select{|name|
        name[0].match(t9_map[phone[0].to_i]) &&
        name[1].match(t9_map[phone[1].to_i]) &&
        name[2].match(t9_map[phone[2].to_i]) &&
        name.strip.size == 3
      }
      names_7R = names.select{|name|
        name[0].match(t9_map[phone[3].to_i]) &&
        name[1].match(t9_map[phone[4].to_i]) &&
        name[2].match(t9_map[phone[5].to_i]) &&
        name[3].match(t9_map[phone[6].to_i]) &&
        name[4].match(t9_map[phone[7].to_i]) &&
        name[5].match(t9_map[phone[8].to_i]) &&
        name[6].match(t9_map[phone[9].to_i]) &&
        name.strip.size == 7
      }
      unless names_7R.empty? || names_7R.empty?
        (names_3L.product names_7R).each do |w|
          words << w
        end
      end

      # 4|6 match:
      # 6686 | 787825
      names_4L = names.select{|name|
        name[0].match(t9_map[phone[0].to_i]) &&
        name[1].match(t9_map[phone[1].to_i]) &&
        name[2].match(t9_map[phone[2].to_i]) &&
        name[3].match(t9_map[phone[3].to_i]) &&
        name.strip.size == 4
      }
      names_6R = names.select{|name|
        name[0].match(t9_map[phone[4].to_i]) &&
        name[1].match(t9_map[phone[5].to_i]) &&
        name[2].match(t9_map[phone[6].to_i]) &&
        name[3].match(t9_map[phone[7].to_i]) &&
        name[4].match(t9_map[phone[8].to_i]) &&
        name[5].match(t9_map[phone[9].to_i]) &&
        name.strip.size == 6
      }
      unless names_4L.empty? || names_6R.empty?
        (names_4L.product names_6R).each do |w|
          words << w
        end
      end

      # 5|5 match:
      # 66867 | 87825
      names_5L = names.select{|name|
        name[0].match(t9_map[phone[0].to_i]) &&
        name[1].match(t9_map[phone[1].to_i]) &&
        name[2].match(t9_map[phone[2].to_i]) &&
        name[3].match(t9_map[phone[3].to_i]) &&
        name[4].match(t9_map[phone[4].to_i]) &&
        name.strip.size == 5
      }
      names_5R = names.select{|name|
        name[0].match(t9_map[phone[5].to_i]) &&
        name[1].match(t9_map[phone[6].to_i]) &&
        name[2].match(t9_map[phone[7].to_i]) &&
        name[3].match(t9_map[phone[8].to_i]) &&
        name[4].match(t9_map[phone[9].to_i]) &&
        name.strip.size == 5
      }
      unless names_5L.empty? || names_5R.empty?
        (names_5L.product names_5R).each do |w|
          words << w
        end
      end

      # 6|4 match:
      # 668678 | 7825
      names_6L = names.select{|name|
        name[0].match(t9_map[phone[0].to_i]) &&
        name[1].match(t9_map[phone[1].to_i]) &&
        name[2].match(t9_map[phone[2].to_i]) &&
        name[3].match(t9_map[phone[3].to_i]) &&
        name[4].match(t9_map[phone[4].to_i]) &&
        name[5].match(t9_map[phone[5].to_i]) &&
        name.strip.size == 6
      }
      names_4R = names.select{|name|
        name[0].match(t9_map[phone[6].to_i]) &&
        name[1].match(t9_map[phone[7].to_i]) &&
        name[2].match(t9_map[phone[8].to_i]) &&
        name[3].match(t9_map[phone[9].to_i]) &&
        name.strip.size == 4
      }
      unless names_6L.empty? || names_4R.empty?
        (names_6L.product names_4R).each do |w|
          words << w
        end
      end

      # 7|3 match:
      # 6686787 | 825
      names_7L = names.select{|name|
        name[0].match(t9_map[phone[0].to_i]) &&
        name[1].match(t9_map[phone[1].to_i]) &&
        name[2].match(t9_map[phone[2].to_i]) &&
        name[3].match(t9_map[phone[3].to_i]) &&
        name[4].match(t9_map[phone[4].to_i]) &&
        name[5].match(t9_map[phone[5].to_i]) &&
        name[6].match(t9_map[phone[6].to_i]) &&
        name.strip.size == 7
      }
      names_3R = names.select{|name|
        name[0].match(t9_map[phone[7].to_i]) &&
        name[1].match(t9_map[phone[8].to_i]) &&
        name[2].match(t9_map[phone[9].to_i]) &&
        name.strip.size == 3
      }
      unless names_7L.empty? || names_3R.empty?
        (names_7L.product names_3R).each do |w|
          words << w
        end
      end

      # 10 match:
      # 6686787825
      names_10 = names.select{|name|
        name[0].match(t9_map[phone[0].to_i]) &&
        name[1].match(t9_map[phone[1].to_i]) &&
        name[2].match(t9_map[phone[2].to_i]) &&
        name[3].match(t9_map[phone[3].to_i]) &&
        name[4].match(t9_map[phone[4].to_i]) &&
        name[5].match(t9_map[phone[5].to_i]) &&
        name[6].match(t9_map[phone[6].to_i]) &&
        name[7].match(t9_map[phone[7].to_i]) &&
        name[8].match(t9_map[phone[8].to_i]) &&
        name[9].match(t9_map[phone[9].to_i]) &&
        name.strip.size == 10
      }
      unless names_10.empty?
        names_10.each do |w|
          words << w
        end
      end

      words.compact
    else
      return "Error: Couldn't find the dictionary file."
    end
  end
end

# T9Words.search "6686787825"
# T9Words.search 2282668687
