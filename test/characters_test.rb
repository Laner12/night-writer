require "./test/testhelper"
require "./lib/characters"

class CharactersTest < Minitest::Test

  def test_it_exists
    char_set = Characters.new

    assert_instance_of Hash, char_set.latin_braille
  end

  def test_it_has_correct_number_of_keys
    char_set = Characters.new

    assert_equal 69, char_set.latin_braille.keys.count
  end

  def test_it_has_correct_number_of_values
    char_set = Characters.new

    assert_equal 69, char_set.latin_braille.values.count
  end

  def test_it_returns_arrays
    char_set = Characters.new

    assert_instance_of Array, char_set.latin_braille["a"]
  end

  def test_it_can_return_braille_for_letter_a
    char_set = Characters.new

    assert_equal ["0.", "..", ".."], char_set.latin_braille["a"]
    assert_equal ["0.", ".0", "00"], char_set.latin_braille["z"]
  end

  def test_it_includes_spaces
    char_set = Characters.new

    assert_equal ["..", "..", ".."], char_set.latin_braille[" "]
  end

  def test_it_returns_nil_if_unknown
    char_set = Characters.new

    assert_equal nil, char_set.latin_braille[">"]
  end
end
