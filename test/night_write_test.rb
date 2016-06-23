require "./test/testhelper"
require "./lib/night_write"

class NightWriteTest < Minitest::Test

  def test_it_exists
    night = NightWrite.new

    assert_instance_of NightWrite, night
  end

  def test_it_has_access_to_the_characters
    night = NightWrite.new

    assert_instance_of Characters, night.characters
  end

  def test_input_to_array_with_a_letter
    night = NightWrite.new

    assert_equal ["a"], night.input_to_array("a")
  end

  def test_input_to_array_with_a_word
    night = NightWrite.new

    assert_equal ["l", "a", "n", "e"], night.input_to_array("lane")
  end

  def test_assigning_a_single_key_to_braille_value
    night = NightWrite.new
    input = ["a"]
    action = night.assign_latin_key_to_braille_value(input)

    assert_equal [["0.", "..", ".."]], action
  end

  def test_assigning_a_set_of_keys_to_braille_values
    night = NightWrite.new
    input = ["l", "a", "n", "e"]
    action = night.assign_latin_key_to_braille_value(input)

    return_value = [["0.", "0.", "0."], ["0.", "..", ".."], ["00", ".0", "0."], ["0.", ".0", ".."]]
    assert_equal return_value, action
  end

  def test_if_character_is_not_known
    night = NightWrite.new
    input = ["<"]
    action = night.assign_latin_key_to_braille_value(input)

    assert_equal [nil], action
  end

  def test_parse_by_braille_index_for_a_letter
    night = NightWrite.new
    input = [["0.", "..", ".."]]
    action = night.parse_by_braille_letter_index(input)

    assert_equal [["0."], [".."], [".."]], action
  end

  def test_parse_by_braille_index_for_two_letters
    night = NightWrite.new
    input = [["0.", "0.", "0."], ["0.", "..", ".."]]
    action = night.parse_by_braille_letter_index(input)

    return_value = [["0.", "0."], ["0.", ".."], ["0.", ".."]]
    assert_equal return_value, action
  end

  def test_format_letter_to_three_lines
    night = NightWrite.new
    input = [["0."], [".."], [".."]]
    action = night.format_letter_to_three_lines(input)

    assert_equal ["0.", "..", ".."], action
  end

  def test_format_two_letters_to_three_lines
    night = NightWrite.new
    input = [["0.", "0."], ["0.", ".."], ["0.", ".."]]
    action = night.format_letter_to_three_lines(input)

    assert_equal ["0.0.", "0...", "0..."], action
  end

  def test_output_to_file_method
    night = NightWrite.new
    input = ["..0.....0.....00....00....0.....00....00....0......0.....0....0.....0.....00..00..0...00..00..0....0...0..0...0....0..00..00..0....00..00..000.000.00..000.000.00..0.0........................0.0000...00.0..0.0..0....00.0.00..",
 "........0............0.....0....0.....00....00....0.....00..........0..........0...0..0...00..00..0...00......0...00.......0...0...0...00..0...0.0.0.0.00..000.000.00...00......0...00..0........0.0..0000..000.......0000..0.00",
 ".0.....0.....0.....0.....0.....0.....0.....0.....0.....0.....00....00....00...0...0...0...0...0...0...0...00..00...0..00..00..00..00..00..00..00..00..00..00..00..00....0...0.0......0..00......0.....0.....0.0........00...0..0"]

  answer = "..0.....0.....00....00....0.....00....00....0......0.....0....0.....0.....00..00
........0............0.....0....0.....00....00....0.....00..........0..........0
.0.....0.....0.....0.....0.....0.....0.....0.....0.....0.....00....00....00...0.
..0...00..00..0....0...0..0...0....0..00..00..0....00..00..000.000.00..000.000.0
...0..0...00..00..0...00......0...00.......0...0...0...00..0...0.0.0.0.00..000.0
..0...0...0...0...0...0...00..00...0..00..00..00..00..00..00..00..00..00..00..00
0..0.0........................0.0000...00.0..0.0..0....00.0.00..
00.00...00......0...00..0........0.0..0000..000.......0000..0.00
..00....0...0.0......0..00......0.....0.....0.0........00...0..0
"
    assert_equal answer, night.output_to_file(input)
  end

  def test_encoding_to_braille_method
    night = NightWrite.new

    answer = "..000.00000.0......0.00.0.....0.0.0..000.00.00
...0...000.000....000.0.0.....00.00.0..00..0.0
.0....0.....0....0.0..0.0....00.0.....0.0.0.0.
"

    assert_equal answer, night.encode_to_braille("Danger Will Robinson")
  end
end
