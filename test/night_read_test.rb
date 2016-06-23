require "./test/testhelper"
require "./lib/night_read"

class NightReadTest < Minitest::Test

  def test_it_exists
    night = NightRead.new

    assert_instance_of NightRead, night
  end

  def test_it_has_access_to_the_characters
    night = NightRead.new

    assert_instance_of Characters, night.characters
  end

  def test_finding_x_axis_with_a_letter
    night = NightRead.new
    input = ["0.", "..", ".."]

    assert_equal [["0.", "..", ".."]], night.finding_x_axis_pairs(input)
  end

  def test_finding_x_axis_with_a_word
    night = NightRead.new
    input = ["0.0.000.", "0....0.0", "0...0..."]
    answer = [["0.", "0.", "0."], ["0.", "..", ".."], ["00", ".0", "0."], ["0.", ".0", ".."]]

    assert_equal answer, night.finding_x_axis_pairs(input)
  end

  def test_decoding_a_single_letter_to_latin
    night = NightRead.new
    input = "0.\n..\n.."

    assert_equal "a", night.decode_to_latin(input)
  end

  def test_decoding_a_word_to_latin
    night = NightRead.new
    input = "0.0.000.\n0....0.0\n0...0..."

    assert_equal "lane", night.decode_to_latin(input)
  end

  def test_parsing_back_into_three_lines
    night = NightRead.new
    input = "..000.00000.0......0.00.0.....0.0.0..000.00.00\n...0...000.000....000.0.0.....00.00.0..00..0.0\n.0....0.....0....0.0..0.0....00.0.....0.0.0.0.\n"

    answer = ["..000.00000.0......0.00.0.....0.0.0..000.00.00", "...0...000.000....000.0.0.....00.00.0..00..0.0", ".0....0.....0....0.0..0.0....00.0.....0.0.0.0."]
    assert_equal answer, night.parsing_back_into_three_lines(input)
    assert_equal 3, answer.length
    assert_equal false, answer.include?("\n")
  end
end
