require 'minitest/autorun'
require './t9_words'

class TestT9 < Minitest::Test

  def test_invalid_phone_number_case1
    invalid_phone_number = "abc123"
    t9 = T9Words.new
    expected = t9.search invalid_phone_number
    assert_equal expected, "Please enter a valid 10 digit phone number"
  end

  def test_invalid_phone_number_case2
    invalid_phone_number = "0186787825" # contains 0 or 1
    t9 = T9Words.new
    expected = t9.search invalid_phone_number
    assert_equal expected, "Error: Phone number should not contain 0 or 1"
  end

  def test_search
    test_phone_number = "6686787825"

    # The entire time will depend on the dictionary size.
    t9 = T9Words.new
    expected = t9.search test_phone_number

    t9_map = {
      "2" => %w(a b c),
      "3" => %w(d e f),
      "4" => %w(g h i),
      "5" => %w(j k l),
      "6" => %w(m n o),
      "7" => %w(p q r s),
      "8" => %w(t u v),
      "9" => %w(w x y z)
    }

    # Checking phone number back..
    expected.each do |w|
      name = ""
      name = w.join('') if w.is_a? Array

      unless name == ""
        assert_equal t9_map.select{|k,v| v.include?(name[0])}.keys[0], test_phone_number[0]
      end
    end
  end
end
